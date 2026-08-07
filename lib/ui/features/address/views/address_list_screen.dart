import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/animations/app_fade_in.dart';
import '../../../../core/animations/app_scale_tap.dart';
import '../../../../data/models/customer_models.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
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
                        );
                      },
                    ),
                  ),
      ),
      floatingActionButton: isEmpty
          ? null
          : FloatingActionButton.extended(
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
}

class _AddressCard extends StatelessWidget {
  final Address address;
  final bool isDefault;
  final VoidCallback onSelectDefault;

  const _AddressCard({
    required this.address,
    required this.isDefault,
    required this.onSelectDefault,
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
      child: InkWell(
        onTap: onSelectDefault,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Compact custom selection dot — replaces the heavy default Radio widget.
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(_getIconForLabel(address.label), size: 16, color: AppColors.primary),
                        const SizedBox(width: 6),
                        Text(address.label, style: AppTextStyles.cardTitle),
                        if (isDefault) ...[
                          const SizedBox(width: AppSpacing.sm),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text('Default', style: AppTextStyles.badge.copyWith(color: AppColors.primary)),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(address.fullAddress, style: AppTextStyles.body),
                    if (address.deliveryInstructions != null && address.deliveryInstructions!.isNotEmpty) ...[
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
            ],
          ),
        ),
      ),
    );
  }
}