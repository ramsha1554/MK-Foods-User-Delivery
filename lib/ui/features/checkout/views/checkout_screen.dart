import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/di/locator.dart';
import '../../../../data/models/common_models.dart';
import '../../../../data/models/customer_models.dart';
import '../../../../data/repositories/customer_repository.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_bottom_sheet.dart';
import '../../../core/widgets/app_dialogs.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../address/providers/address_provider.dart';
import '../../address/views/add_address_screen.dart';
import '../../address/views/map_address_picker_screen.dart';
import '../../cart/providers/cart_provider.dart';
import '../../orders/views/order_details_screen.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  static const _useCurrentLocationId = '__use_current_location__';
  static const _addNewAddressId = '__add_new_address__';

  late final TextEditingController _instructionsController;
  String? _selectedAddressId;
  MapAddressPick? _currentLocationPick;
  bool _isPlacingOrder = false;

  @override
  void initState() {
    super.initState();
    final addressState = ref.read(addressProvider);
    _selectedAddressId = addressState.defaultAddress?.id;
    _instructionsController = TextEditingController(
      text: ref.read(cartProvider).specialInstructions,
    );
  }

  @override
  void dispose() {
    _instructionsController.dispose();
    super.dispose();
  }

  Address? _resolveSelectedAddress(AddressState addressState) {
    final pick = _currentLocationPick;
    if (pick != null) {

      return Address(
        id: 'current-location',
        label: 'Current Location',
        fullAddress: pick.address,
        isDefault: false,
        location: GeoPoint(
          type: 'Point',
          coordinates: [pick.longitude, pick.latitude],
        ),
        street: pick.street,
        city: pick.city,
        postcode: pick.postcode,
      );
    }
    if (_selectedAddressId == null) return null;
    for (final a in addressState.addresses) {
      if (a.id == _selectedAddressId) return a;
    }
    return null;
  }

  Future<void> _openMapPicker() async {
    final pick = await Navigator.of(context).push<MapAddressPick>(
      MaterialPageRoute(builder: (_) => const MapAddressPickerScreen()),
    );
    if (pick == null || !mounted) return;
    setState(() {
      _currentLocationPick = pick;
      _selectedAddressId = null;
    });
  }

  Future<void> _openAddAddressFlow() async {
    final pick = await Navigator.of(context).push<MapAddressPick>(
      MaterialPageRoute(builder: (_) => const MapAddressPickerScreen()),
    );
    if (pick == null || !mounted) return;

    final idsBefore = ref.read(addressProvider).addresses.map((a) => a.id).toSet();
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AddAddressScreen(
          initialLatitude: pick.latitude,
          initialLongitude: pick.longitude,
          initialAddress: pick.address,
          initialStreet: pick.street,
          initialCity: pick.city,
          initialPostcode: pick.postcode,
        ),
      ),
    );
    if (!mounted) return;

    Address? newAddress;
    for (final a in ref.read(addressProvider).addresses) {
      if (!idsBefore.contains(a.id)) {
        newAddress = a;
        break;
      }
    }
    if (newAddress == null) return;

    setState(() {
      _selectedAddressId = newAddress!.id;
      _currentLocationPick = null;
    });
  }

  Future<void> _pickAddress(AddressState addressState) async {
    final picked = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: AppSpacing.sm),
            const AppSheetHandle(),
            const SizedBox(height: AppSpacing.sm),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Select delivery address', style: AppTextStyles.h2),
              ),
            ),
            for (final addr in addressState.addresses)
              ListTile(
                leading: const Icon(LucideIcons.mapPin, color: AppColors.primary),
                title: Text(addr.label, style: AppTextStyles.cardTitle),
                subtitle: Text(
                  addr.fullAddress,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySecondary,
                ),
                onTap: () => Navigator.pop(ctx, addr.id),
              ),
            const Divider(height: 1, color: AppColors.divider),
            ListTile(
              leading: const Icon(LucideIcons.locateFixed, color: AppColors.primary),
              title: Text('Use Current Location', style: AppTextStyles.cardTitle),
              subtitle: Text(
                'Pick your delivery spot on the map',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodySecondary,
              ),
              onTap: () => Navigator.pop(ctx, _useCurrentLocationId),
            ),
            ListTile(
              leading: const Icon(LucideIcons.plus, color: AppColors.primary),
              title: Text('Add New Address', style: AppTextStyles.cardTitle),
              subtitle: Text(
                'Pick a spot on the map and save it',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodySecondary,
              ),
              onTap: () => Navigator.pop(ctx, _addNewAddressId),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ),
      ),
    );
    if (picked == _useCurrentLocationId) {
      await _openMapPicker();
      return;
    }
    if (picked == _addNewAddressId) {
      await _openAddAddressFlow();
      return;
    }
    if (picked != null) {
      setState(() {
        _selectedAddressId = picked;
        _currentLocationPick = null;
      });
    }
  }

  Future<void> _placeOrder(Address address, double deliveryFee) async {
    final cart = ref.read(cartProvider);

    if (address.location == null) {
      _showError('Selected address is missing location data.');
      return;
    }

    setState(() => _isPlacingOrder = true);

    final request = PlaceOrderRequest(
      restaurantId: cart.restaurantId!,
      items: cart.items
          .map((c) => OrderItemInput(menuItemId: c.menuItem.id, quantity: c.quantity))
          .toList(),
      deliveryAddress: DeliveryAddressDetail(
        label: address.label,
        fullAddress: address.fullAddress,
        longitude: address.location?.coordinates[0],
        latitude: address.location?.coordinates[1],
        street: address.street,
        city: address.city,
        postcode: address.postcode,
        deliveryInstructions: address.deliveryInstructions,
      ),
      paymentMethod: 'cash',
      specialInstructions: _instructionsController.text.trim().isEmpty
          ? null
          : _instructionsController.text.trim(),
    );

    try {
      final order = await locator<CustomerRepository>().placeOrder(request);
      ref.read(cartProvider.notifier).clearCart();

      if (!mounted) return;
      await showAppMessageDialog(
        context,
        title: 'Order Placed!',
        message: 'Your order ${order.orderNumber} has been placed successfully. '
            'You\'ll be notified as it progresses.',
        icon: LucideIcons.circleCheck,
        barrierDismissible: false,
        actionLabel: 'Done',
        onAction: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => OrderDetailsScreen(orderId: order.id),
          ),
        ),
      );
    } catch (e) {
      _showError(e.toString().replaceAll('Exception: ', ''));
    } finally {
      if (mounted) setState(() => _isPlacingOrder = false);
    }
  }

  void _showError(String message) {
    AppSnackbar.show(context, message, type: AppSnackbarType.error);
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    final addressState = ref.watch(addressProvider);
    final selectedAddress = _resolveSelectedAddress(addressState);
    final deliveryFee = cart.deliveryFee ?? 0;
    final total = cart.subtotal + deliveryFee;

    if (cart.isEmpty) {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(title: const Text('Checkout')),
        body: Center(
          child: Text('Your cart is empty.', style: AppTextStyles.bodySecondary),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Checkout')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          // ── Delivery Address ──
          _SectionCard(
            title: 'Delivery Address',
            trailing: TextButton(
              onPressed: () => _pickAddress(addressState),
              child: const Text('Change'),
            ),
            child: selectedAddress == null
                ? Text('No address selected', style: AppTextStyles.bodySecondary)
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(LucideIcons.mapPin, color: AppColors.primary, size: 18),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(selectedAddress.label, style: AppTextStyles.cardTitle),
                            const SizedBox(height: 2),
                            Text(selectedAddress.fullAddress, style: AppTextStyles.bodySecondary),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          const SizedBox(height: AppSpacing.md),

          // ── Order Items ──
          _SectionCard(
            title: '${cart.restaurantName ?? 'Order'} (${cart.itemCount} items)',
            child: Column(
              children: [
                for (final item in cart.items)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                    child: Row(
                      children: [
                        Text('${item.quantity}x', style: AppTextStyles.bodySecondary),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(child: Text(item.menuItem.name, style: AppTextStyles.body)),
                        Text('£${item.itemTotal.toStringAsFixed(2)}', style: AppTextStyles.price),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // ── Special Instructions ──
          _SectionCard(
            title: 'Special Instructions',
            child: TextField(
              controller: _instructionsController,
              maxLines: 2,
              style: AppTextStyles.body,
              decoration: const InputDecoration(
                hintText: 'e.g. no onions, ring the bell...',
                isDense: true,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // ── Payment Method ──
          _SectionCard(
            title: 'Payment Method',
            child: Row(
              children: [
                const Icon(LucideIcons.banknote, color: AppColors.success, size: 20),
                const SizedBox(width: AppSpacing.sm),
                Text('Cash on Delivery', style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w700)),
                const Spacer(),
                const Icon(LucideIcons.circleCheck, color: AppColors.success, size: 20),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // ── Bill Summary ──
          _SectionCard(
            title: 'Bill Summary',
            child: Column(
              children: [
                _BillRow(label: 'Subtotal', value: cart.subtotal),
                _BillRow(label: 'Delivery Fee', value: deliveryFee),
                const Divider(height: AppSpacing.xl, color: AppColors.divider),
                _BillRow(label: 'Total', value: total, isTotal: true),
              ],
            ),
          ),

          if (!cart.isMinimumOrderMet) ...[
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Minimum order is £${(cart.minimumOrder ?? 0).toStringAsFixed(2)}. '
                'Add £${((cart.minimumOrder ?? 0) - cart.subtotal).toStringAsFixed(2)} more to checkout.',
                style: AppTextStyles.caption.copyWith(color: AppColors.warning, fontWeight: FontWeight.w600),
              ),
            ),
          ],
          const SizedBox(height: 100),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              // No style override — inherits AppColors.primary, elevation: 0,
              // and 16px radius directly from elevatedButtonTheme, keeping this
              // button visually identical to every other primary button in the app.
              onPressed: (!cart.isMinimumOrderMet || selectedAddress == null || _isPlacingOrder)
                  ? null
                  : () => _placeOrder(selectedAddress, deliveryFee),
              child: _isPlacingOrder
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : Text(
                      'Place Order • £${total.toStringAsFixed(2)}',
                      style: AppTextStyles.cardTitle.copyWith(fontWeight: FontWeight.w800),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? trailing;

  const _SectionCard({required this.title, required this.child, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(title, style: AppTextStyles.sectionLabel)),
              if (trailing != null) trailing!,
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          child,
        ],
      ),
    );
  }
}

class _BillRow extends StatelessWidget {
  final String label;
  final double value;
  final bool isTotal;

  const _BillRow({required this.label, required this.value, this.isTotal = false});

  @override
  Widget build(BuildContext context) {
    final style = isTotal
        ? AppTextStyles.cardTitle.copyWith(fontWeight: FontWeight.w800)
        : AppTextStyles.bodySecondary;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(label, style: style),
          const Spacer(),
          Text('£${value.toStringAsFixed(2)}', style: style),
        ],
      ),
    );
  }
}