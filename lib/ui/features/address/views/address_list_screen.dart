import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/animations/app_fade_in.dart';
import '../../../../core/animations/app_scale_tap.dart';
import '../../../../data/models/customer_models.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_bottom_sheet.dart';
import '../../../core/widgets/app_dialogs.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../providers/address_provider.dart';
import 'add_address_screen.dart';

class AddressListScreen extends ConsumerWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressState = ref.watch(addressProvider);
    final isEmpty = !addressState.isLoading && addressState.addresses.isEmpty;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Saved Addresses')),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () => ref.read(addressProvider.notifier).fetchAddresses(),
        child: addressState.isLoading && addressState.addresses.isEmpty
            ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
            : isEmpty
                ? _buildEmptyState(context)
                : AppFadeIn(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      itemCount: addressState.addresses.length,
                      itemBuilder: (context, index) {
                        final address = addressState.addresses[index];
                        return _AddressCard(
                          address: address,
                          isDefault: address.isDefault,
                          onSelectDefault: () {
                            if (!address.isDefault) {
                              ref.read(addressProvider.notifier).setDefaultAddress(address.id);
                            }
                          },
                          onEdit: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AddAddressScreen(editAddress: address),
                            ),
                          ),
                          onDelete: () => _confirmDelete(context, ref, address),
                        );
                      },
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton.extended(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddAddressScreen()),
              ),
              backgroundColor: AppColors.primary,
              icon: const Icon(LucideIcons.plus, color: Colors.white),
              label: const Text(
                'Add Address',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: const BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle),
              child: const Icon(LucideIcons.mapPin, size: 40, color: AppColors.primary),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text('No saved addresses', style: AppTextStyles.h2, textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Save your home, office or other delivery addresses to order faster.',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySecondary,
            ),
            const SizedBox(height: AppSpacing.xxl),
            AppScaleTap(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddAddressScreen()),
              ),
              child: ElevatedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddAddressScreen()),
                ),
                icon: const Icon(LucideIcons.plus, color: Colors.white),
                label: const Text('Add Address', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, Address address) async {
    final confirmed = await showAppConfirmDialog(
      context,
      title: 'Delete address?',
      message: '"${address.fullAddress}" will be permanently removed.',
      confirmLabel: 'Delete',
      isDestructive: true,
    );

    if (confirmed == true && context.mounted) {
      final success = await ref.read(addressProvider.notifier).deleteAddress(address.id);
      if (context.mounted) {
        AppSnackbar.show(
          context,
          success ? 'Address deleted.' : 'Failed to delete address.',
          type: success ? AppSnackbarType.success : AppSnackbarType.error,
        );
      }
    }
  }
}

class _AddressCard extends StatelessWidget {
  final Address address;
  final bool isDefault;
  final VoidCallback onSelectDefault;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _AddressCard({
    required this.address,
    required this.isDefault,
    required this.onSelectDefault,
    required this.onEdit,
    required this.onDelete,
  });

  IconData _getIconForLabel(String label) {
    switch (label.toLowerCase()) {
      case 'home':
        return LucideIcons.house;
      case 'office':
      case 'work':
        return LucideIcons.briefcase;
      default:
        return LucideIcons.mapPin;
    }
  }

  void _showActions(BuildContext context) {
    showModalBottomSheet(
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
            ListTile(
              leading: const Icon(LucideIcons.pencil, color: AppColors.textPrimary),
              title: const Text('Update Address', style: AppTextStyles.body),
              onTap: () {
                Navigator.pop(ctx);
                onEdit();
              },
            ),
            ListTile(
              leading: const Icon(LucideIcons.trash2, color: AppColors.error),
              title: const Text('Delete Address', style: TextStyle(color: AppColors.error)),
              onTap: () {
                Navigator.pop(ctx);
                onDelete();
              },
            ),
            const Divider(height: 1, color: AppColors.divider),
            ListTile(
              title: const Text(
                'Cancel',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySecondary,
              ),
              onTap: () => Navigator.pop(ctx),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDefault ? AppColors.primary : AppColors.cardBorder,
          width: isDefault ? 1.5 : 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            InkWell(
              onTap: onSelectDefault,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Selection dot
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isDefault ? AppColors.primary : AppColors.textHint,
                            width: 2,
                          ),
                        ),
                        child: isDefault
                            ? Center(
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primary,
                                  ),
                                ),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),

                    // Icon avatar
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryLight,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(_getIconForLabel(address.label), size: 18, color: AppColors.primary),
                    ),
                    const SizedBox(width: AppSpacing.md),

                    // Label + address + instructions
                    Expanded(
                      child: Padding(
                        // Right padding keeps text clear of the corner badge above it
                        // and the menu button beside it, regardless of text length.
                        padding: const EdgeInsets.only(right: 28, top: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(address.label, style: AppTextStyles.cardTitle),
                            const SizedBox(height: 4),
                            Text(address.fullAddress, style: AppTextStyles.body),
                            if (address.deliveryInstructions != null &&
                                address.deliveryInstructions!.isNotEmpty) ...[
                              const SizedBox(height: AppSpacing.sm),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(LucideIcons.info, size: 13, color: AppColors.textSecondary),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Text(address.deliveryInstructions!, style: AppTextStyles.caption),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Menu button — floats independently, never competes for row space.
            Positioned(
              top: AppSpacing.sm,
              right: AppSpacing.xs,
              child: IconButton(
                icon: const Icon(LucideIcons.ellipsisVertical, size: 18, color: AppColors.textSecondary),
                onPressed: () => _showActions(context),
              ),
            ),

            // "Default" ribbon — pinned to the corner, independent of label length.
            if (isDefault)
              Positioned(
                top: AppSpacing.sm,
                right: 44,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text('Default', style: AppTextStyles.badge.copyWith(color: AppColors.primary)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}