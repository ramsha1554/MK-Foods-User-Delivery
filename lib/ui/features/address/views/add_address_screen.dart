import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../../core/animations/app_fade_in.dart';
import '../../../../data/models/customer_models.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../providers/address_provider.dart';

class AddAddressScreen extends ConsumerStatefulWidget {
  final Address? editAddress;
  final double? initialLatitude;
  final double? initialLongitude;
  final String? initialAddress;
  final String? initialStreet;
  final String? initialCity;
  final String? initialPostcode;

  const AddAddressScreen({
    super.key,
    this.editAddress,
    this.initialLatitude,
    this.initialLongitude,
    this.initialAddress,
    this.initialStreet,
    this.initialCity,
    this.initialPostcode,
  });

  @override
  ConsumerState<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends ConsumerState<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();

  String _selectedLabel = 'Home';
  final _customLabelController = TextEditingController();
  final _fullAddressController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _postcodeController = TextEditingController();
  final _latController = TextEditingController(text: '52.0406');
  final _lngController = TextEditingController(text: '-0.7594');
  final _instructionsController = TextEditingController();

  late bool _isDefault;
  bool _isFirstAddress = false;

  bool get _isEditMode => widget.editAddress != null;

  @override
  void initState() {
    super.initState();
    final editAddr = widget.editAddress;
    if (editAddr != null) {
      // Edit mode — pre-fill all fields from the existing address
      final knownLabels = ['Home', 'Office', 'Other'];
      final isKnown = knownLabels.contains(editAddr.label);
      _selectedLabel = isKnown ? editAddr.label : 'Other';
      if (!isKnown) _customLabelController.text = editAddr.label;
      _fullAddressController.text = editAddr.fullAddress;
      _streetController.text = editAddr.street ?? '';
      _cityController.text = editAddr.city ?? '';
      _postcodeController.text = editAddr.postcode ?? '';
      if (editAddr.location != null && editAddr.location!.coordinates.length >= 2) {
        _lngController.text = editAddr.location!.coordinates[0].toString();
        _latController.text = editAddr.location!.coordinates[1].toString();
      }
      _instructionsController.text = editAddr.deliveryInstructions ?? '';
      _isDefault = editAddr.isDefault;
      _isFirstAddress = false;
    } else {
      // Add mode
      final addressState = ref.read(addressProvider);
      _isFirstAddress = addressState.addresses.isEmpty;
      _isDefault = _isFirstAddress;
      // Pre-fill from the map picker (if any) so the user keeps the chosen
      // spot; all fields remain editable.
      if (widget.initialLatitude != null) {
        _latController.text = widget.initialLatitude.toString();
      }
      if (widget.initialLongitude != null) {
        _lngController.text = widget.initialLongitude.toString();
      }
      final initialAddress = widget.initialAddress;
      if (initialAddress != null && initialAddress.trim().isNotEmpty) {
        _fullAddressController.text = initialAddress.trim();
      }
      // Populate the individual required fields from the map picker. Fields
      // that couldn't be resolved are left empty so the user fills them in
      // manually rather than submitting an empty required value.
      final initialStreet = widget.initialStreet;
      if (initialStreet != null && initialStreet.trim().isNotEmpty) {
        _streetController.text = initialStreet.trim();
      }
      final initialCity = widget.initialCity;
      if (initialCity != null && initialCity.trim().isNotEmpty) {
        _cityController.text = initialCity.trim();
      }
      final initialPostcode = widget.initialPostcode;
      if (initialPostcode != null && initialPostcode.trim().isNotEmpty) {
        _postcodeController.text = initialPostcode.trim();
      }
    }
  }

  @override
  void dispose() {
    _customLabelController.dispose();
    _fullAddressController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _postcodeController.dispose();
    _latController.dispose();
    _lngController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final label = _selectedLabel == 'Other' && _customLabelController.text.trim().isNotEmpty
        ? _customLabelController.text.trim()
        : _selectedLabel;

    final request = SaveAddressRequest(
      label: label,
      fullAddress: _fullAddressController.text.trim(),
      street: _streetController.text.trim(),
      city: _cityController.text.trim(),
      postcode: _postcodeController.text.trim(),
      latitude: double.tryParse(_latController.text.trim()) ?? 52.0406,
      longitude: double.tryParse(_lngController.text.trim()) ?? -0.7594,
      isDefault: _isDefault,
      deliveryInstructions:
          _instructionsController.text.trim().isEmpty ? null : _instructionsController.text.trim(),
    );

    final bool success;
    if (_isEditMode) {
      success = await ref.read(addressProvider.notifier).updateAddress(widget.editAddress!.id, request);
    } else {
      success = await ref.read(addressProvider.notifier).saveAddress(request);
    }

    if (success && mounted) {
      AppSnackbar.show(
        context,
        _isEditMode ? 'Address updated!' : 'Address saved successfully!',
        type: AppSnackbarType.success,
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final addressState = ref.watch(addressProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text(_isEditMode ? 'Edit Address' : 'Add Delivery Address')),
      body: AppFadeIn(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (addressState.errorMessage != null) ...[
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    margin: const EdgeInsets.only(bottom: AppSpacing.lg),
                    decoration: BoxDecoration(
                      color: AppColors.error.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                      border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                    ),
                    child: Text(addressState.errorMessage!, style: AppTextStyles.caption.copyWith(color: AppColors.error)),
                  ),
                ],

                // ── Address Label ──
                Text('Address Label', style: AppTextStyles.sectionLabel),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: ['Home', 'Office', 'Other'].map((label) {
                    final isSelected = _selectedLabel == label;
                    return Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.sm),
                      child: ChoiceChip(
                        label: Text(label),
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) setState(() => _selectedLabel = label);
                        },
                        selectedColor: AppColors.primary,
                        backgroundColor: AppColors.surface,
                        side: BorderSide(color: isSelected ? AppColors.primary : AppColors.cardBorder),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill)),
                        showCheckmark: false,
                        labelStyle: AppTextStyles.caption.copyWith(
                          color: isSelected ? Colors.white : AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                if (_selectedLabel == 'Other') ...[
                  const SizedBox(height: AppSpacing.sm),
                  TextFormField(
                    controller: _customLabelController,
                    decoration: const InputDecoration(hintText: "e.g. Friend's House, Gym"),
                  ),
                ],
                const SizedBox(height: AppSpacing.xl),

                // ── Address Details ──
                Text('Address Details', style: AppTextStyles.sectionLabel),
                const SizedBox(height: AppSpacing.sm),
                TextFormField(
                  controller: _fullAddressController,
                  decoration: const InputDecoration(
                    labelText: 'Full Address *',
                    hintText: 'e.g. 15 Midsummer Blvd, Milton Keynes MK9 3GB',
                    prefixIcon: Icon(LucideIcons.mapPin, size: 20),
                  ),
                  validator: (val) => val == null || val.trim().isEmpty ? 'Full address is required' : null,
                ),
                const SizedBox(height: AppSpacing.md),
                TextFormField(
                  controller: _streetController,
                  decoration: const InputDecoration(labelText: 'Street *', hintText: 'e.g. Midsummer Blvd'),
                  validator: (val) => val == null || val.trim().isEmpty ? 'Street is required' : null,
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _cityController,
                        decoration: const InputDecoration(labelText: 'City *', hintText: 'Milton Keynes'),
                        validator: (val) => val == null || val.trim().isEmpty ? 'City is required' : null,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: TextFormField(
                        controller: _postcodeController,
                        decoration: const InputDecoration(labelText: 'Postcode *', hintText: 'MK9 3GB'),
                        validator: (val) => val == null || val.trim().isEmpty ? 'Postcode is required' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xl),

                // ── GPS Coordinates — recessed, secondary emphasis ──
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(LucideIcons.locateFixed, size: 15, color: AppColors.textSecondary),
                          const SizedBox(width: 6),
                          Text('GPS Coordinates', style: AppTextStyles.sectionLabel),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Pre-filled automatically — only edit if needed.',
                        style: AppTextStyles.caption,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _latController,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                              decoration: const InputDecoration(labelText: 'Latitude *', isDense: true),
                              validator: (val) {
                                if (val == null || val.trim().isEmpty) return 'Required';
                                final n = double.tryParse(val.trim());
                                if (n == null || n < -90 || n > 90) return 'Invalid';
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: TextFormField(
                              controller: _lngController,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                              decoration: const InputDecoration(labelText: 'Longitude *', isDense: true),
                              validator: (val) {
                                if (val == null || val.trim().isEmpty) return 'Required';
                                final n = double.tryParse(val.trim());
                                if (n == null || n < -180 || n > 180) return 'Invalid';
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),

                TextFormField(
                  controller: _instructionsController,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    labelText: 'Delivery Instructions (Optional)',
                    hintText: 'e.g. Ring door bell, leave at reception',
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    border: Border.all(color: AppColors.cardBorder),
                  ),
                  child: SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Set as default address',
                        style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600)),
                    subtitle: Text(
                      _isFirstAddress
                          ? 'This is your first address and will automatically be set as default.'
                          : 'Orders will use this address by default.',
                      style: AppTextStyles.caption,
                    ),
                    value: _isDefault,
                    onChanged: _isFirstAddress ? null : (val) => setState(() => _isDefault = val),
                    activeThumbColor: AppColors.primary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxl),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: addressState.isSaving ? null : _submitForm,
                    child: addressState.isSaving
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                          )
                        : Text(
                            _isEditMode ? 'Update Address' : 'Save Address',
                            style: AppTextStyles.cardTitle.copyWith(fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}