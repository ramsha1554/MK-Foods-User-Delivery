import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/utils/app_log.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_snackbar.dart';

/// Result returned by [MapAddressPickerScreen] when the user confirms a spot.
/// Carries the camera-centre coordinates plus the reverse-geocoded address.
/// [address] is a human-readable summary line; the individual [street],
/// [city] and [postcode] fields are passed through separately so the address
/// form can pre-fill the exact fields the backend validates (they may be null
/// when reverse geocoding can't resolve them).
class MapAddressPick {
  final double latitude;
  final double longitude;
  final String address;
  final String? street;
  final String? city;
  final String? postcode;

  const MapAddressPick({
    required this.latitude,
    required this.longitude,
    required this.address,
    this.street,
    this.city,
    this.postcode,
  });
}

/// Full-screen location picker with a fixed centre pin (Zomato/Swiggy style).
/// The map moves underneath the pin; when the camera settles the centre
/// coordinates are reverse-geocoded and shown in the bottom panel.
class MapAddressPickerScreen extends StatefulWidget {
  const MapAddressPickerScreen({super.key});

  @override
  State<MapAddressPickerScreen> createState() => _MapAddressPickerScreenState();
}

class _MapAddressPickerScreenState extends State<MapAddressPickerScreen> {
  // Fallback camera target matching the app's existing default coordinates
  // (Milton Keynes), used when current-location lookup is unavailable.
  static const LatLng _defaultTarget = LatLng(52.0406, -0.7594);
  static const double _defaultZoom = 15;

  GoogleMapController? _mapController;
  LatLng _selectedPosition = _defaultTarget;
  String? _resolvedAddress;
  String? _resolvedStreet;
  String? _resolvedCity;
  String? _resolvedPostcode;
  bool _isGeocoding = false;
  bool _isInitializing = false;
  bool _canShowMyLocation = false;
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  String? _searchError;

  // Monotonic guard so a stale reverse-geocode response can never overwrite a
  // newer one (e.g. user moves A -> B, A's response arrives after B's).
  int _geocodeRequestId = 0;

  @override
  void dispose() {
    _searchController.dispose();
    _mapController = null;
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _initializeLocation();
    // Kick off the first reverse-geocode once the initial camera settles so
    // the bottom panel isn't blank before the user moves the map.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleCameraIdle();
    });
  }

  Future<void> _initializeLocation() async {
    if (_isInitializing) return;
    _isInitializing = true;
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (mounted) {
          AppSnackbar.show(
            context,
            'Location services are off. Move the map to pick a spot.',
            type: AppSnackbarType.info,
          );
        }
        return;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        if (mounted) {
          AppSnackbar.show(
            context,
            'Location permission is needed to jump to your area. '
            'You can still move the map to pick a spot.',
            type: AppSnackbarType.info,
          );
        }
        return;
      }

      if (!mounted) return;
      setState(() => _canShowMyLocation = true);

      Position position;
      try {
        position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            timeLimit: Duration(seconds: 12),
          ),
        );
      } catch (e) {
        AppLog.w(
          '[MAP]',
          'locate',
          'getCurrentPosition failed, falling back to last known',
          {'error': e.toString()},
        );
        final lastKnown = await Geolocator.getLastKnownPosition();
        if (lastKnown == null) rethrow;
        position = lastKnown;
      }

      if (!mounted) return;
      final target = LatLng(position.latitude, position.longitude);
      await _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(target, _defaultZoom),
      );
    } catch (e, st) {
      AppLog.e('[MAP]', 'locate', 'Could not get current location', null, e, st);
      if (mounted) {
        AppSnackbar.show(
          context,
          "Couldn't fetch your location. Move the map to select a delivery spot.",
          type: AppSnackbarType.info,
        );
      }
    } finally {
      _isInitializing = false;
    }
  }

  Future<void> _searchLocation() async {
    final query = _searchController.text.trim();
    if (query.isEmpty || _isSearching) return;
    FocusScope.of(context).unfocus();
    setState(() {
      _isSearching = true;
      _searchError = null;
    });

    List<Location> results;
    try {
      results = await locationFromAddress(query).timeout(const Duration(seconds: 12));
    } catch (e) {
      AppLog.w(
        '[MAP]',
        'search',
        'locationFromAddress failed',
        {'query': query, 'error': e.toString()},
      );
      results = const [];
    }

    if (!mounted) return;
    setState(() => _isSearching = false);

    if (results.isEmpty) {
      setState(() {
        _searchError = "Couldn't find that location — try a different search";
      });
      return;
    }

    final first = results.first;
    await _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(first.latitude, first.longitude),
        _defaultZoom,
      ),
    );
  }

  Future<LatLng?> _cameraCenter() async {
    final controller = _mapController;
    if (controller == null) return null;
    try {
      final bounds = await controller.getVisibleRegion();
      return LatLng(
        (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
        (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> _handleCameraIdle() async {
    final center = await _cameraCenter();
    if (center == null) return;
    await _reverseGeocode(center);
  }

  Future<void> _reverseGeocode(LatLng position) async {
    final requestId = ++_geocodeRequestId;
    if (mounted) setState(() => _isGeocoding = true);

    ({String full, String? street, String? city, String? postcode}) parts =
        (full: '', street: null, city: null, postcode: null);
    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      ).timeout(const Duration(seconds: 10));
      parts = _buildAddressParts(placemarks.isNotEmpty ? placemarks.first : null);
    } catch (e) {
      AppLog.w(
        '[MAP]',
        'reverseGeocode',
        'Failed to resolve address',
        {'lat': position.latitude, 'lng': position.longitude, 'error': e.toString()},
      );
    }

    // Discard stale results and avoid setState after disposal.
    if (!mounted || requestId != _geocodeRequestId) return;

    setState(() {
      _selectedPosition = position;
      _resolvedAddress = parts.full.isEmpty ? _coordinatesLabel(position) : parts.full;
      _resolvedStreet = parts.street;
      _resolvedCity = parts.city;
      _resolvedPostcode = parts.postcode;
      _isGeocoding = false;
    });
  }

  // Splits a Placemark into the individual fields the address form/backend
  // validate (street, city, postcode) plus a combined display line. Fields
  // that couldn't be resolved are returned as null so the user can fill them
  // in manually on the form instead of submitting an empty required field.
  ({String full, String? street, String? city, String? postcode}) _buildAddressParts(
      Placemark? p) {
    if (p == null) return (full: '', street: null, city: null, postcode: null);

    final street = [p.subThoroughfare, p.thoroughfare]
        .where((e) => e != null && e.trim().isNotEmpty)
        .join(' ')
        .trim();
    final city = (p.locality ?? '').trim();
    final postcode = (p.postalCode ?? '').trim();

    final lines = <String>[];
    if (street.isNotEmpty) lines.add(street);
    for (final part in [p.subLocality, p.locality, p.postalCode, p.country]) {
      if (part == null || part.trim().isEmpty) continue;
      if (!lines.contains(part.trim())) lines.add(part.trim());
    }

    return (
      full: lines.join(', '),
      street: street.isEmpty ? null : street,
      city: city.isEmpty ? null : city,
      postcode: postcode.isEmpty ? null : postcode,
    );
  }

  String _coordinatesLabel(LatLng position) =>
      '${position.latitude.toStringAsFixed(5)}, ${position.longitude.toStringAsFixed(5)}';

  void _confirmLocation() {
    final address = _resolvedAddress;
    if (_isGeocoding || address == null) return;
    Navigator.of(context).pop(
      MapAddressPick(
        latitude: _selectedPosition.latitude,
        longitude: _selectedPosition.longitude,
        address: address,
        street: _resolvedStreet,
        city: _resolvedCity,
        postcode: _resolvedPostcode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Pick Location'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: _defaultTarget,
                    zoom: _defaultZoom,
                  ),
                  mapType: MapType.normal,
                  onMapCreated: _onMapCreated,
                  onCameraIdle: _handleCameraIdle,
                  myLocationEnabled: _canShowMyLocation,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  compassEnabled: true,
                ),
                // Fixed centre pin — the map moves underneath it.
                const Align(
                  alignment: Alignment.center,
                  child: _CenterPin(),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        AppSpacing.lg,
                        kToolbarHeight,
                        AppSpacing.lg,
                        0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSearchField(),
                          if (_searchError != null) ...[
                            const SizedBox(height: AppSpacing.sm),
                            _buildSearchError(_searchError!),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
                // Re-centre on the user's current location.
                Positioned(
                  top: AppSpacing.md,
                  right: AppSpacing.lg,
                  child: FloatingActionButton(
                    heroTag: 'map_my_location',
                    mini: true,
                    elevation: 2,
                    backgroundColor: AppColors.surface,
                    foregroundColor: AppColors.primary,
                    onPressed: _initializeLocation,
                    child: const Icon(LucideIcons.locateFixed, size: 20),
                  ),
                ),
              ],
            ),
          ),
          _buildBottomPanel(),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Material(
      elevation: 3,
      shadowColor: AppColors.shadow,
      borderRadius: BorderRadius.circular(AppRadius.md),
      color: AppColors.surface,
      child: TextField(
        controller: _searchController,
        textInputAction: TextInputAction.search,
        onSubmitted: (_) => _searchLocation(),
        style: AppTextStyles.body,
        decoration: InputDecoration(
          hintText: 'Search area, street, or postcode',
          hintStyle: AppTextStyles.bodySecondary,
          prefixIcon: const Icon(LucideIcons.search, size: 20, color: AppColors.primary),
          suffixIcon: _isSearching
              ? const Padding(
                  padding: EdgeInsets.all(14),
                  child: SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary),
                  ),
                )
              : IconButton(
                  onPressed: _searchLocation,
                  tooltip: 'Search',
                  icon: const Icon(LucideIcons.search, size: 20, color: AppColors.primary),
                ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildSearchError(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: const [
          BoxShadow(color: AppColors.shadow, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(LucideIcons.alertCircle, size: 14, color: AppColors.error),
          const SizedBox(width: AppSpacing.xs),
          Flexible(
            child: Text(
              message,
              style: AppTextStyles.caption.copyWith(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPanel() {
    final address = _resolvedAddress;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        border: Border(top: BorderSide(color: AppColors.cardBorder)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(LucideIcons.mapPin, size: 16, color: AppColors.primary),
                const SizedBox(width: AppSpacing.sm),
                const Text('Selected Address', style: AppTextStyles.sectionLabel),
                const Spacer(),
                if (_isGeocoding)
                  const SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primary,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              _isGeocoding
                  ? 'Resolving address…'
                  : (address ?? 'Move the map to choose a location'),
              style: _isGeocoding ? AppTextStyles.bodySecondary : AppTextStyles.body,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: (_isGeocoding || address == null) ? null : _confirmLocation,
                child: Text(
                  'Confirm Location',
                  style: AppTextStyles.cardTitle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CenterPin extends StatelessWidget {
  const _CenterPin();

  @override
  Widget build(BuildContext context) {
    // Shifted up by half the icon height so the pin tip marks the exact
    // centre of the map-selection area.
    return IgnorePointer(
      child: Transform.translate(
        offset: const Offset(0, -26),
        child: const Icon(
          LucideIcons.mapPin,
          size: 52,
          color: AppColors.primary,
          shadows: [
            Shadow(
              blurRadius: 10,
              color: Color(0x55000000),
              offset: Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }
}