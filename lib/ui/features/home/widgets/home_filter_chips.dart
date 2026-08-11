import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';

/// "Filters" and "Offers" are UI-only placeholders — no filtering-by-offer
/// or generic-filter backend exists. "Near & Fast" is real: it triggers a
/// client-side sort by preparationTime, no backend change needed.
class HomeFilterChips extends StatelessWidget {
  final bool nearFastActive;
  final ValueChanged<bool> onNearFastToggle;
  final VoidCallback onFiltersTap;
  final VoidCallback onOffersTap;

  const HomeFilterChips({
    super.key,
    required this.nearFastActive,
    required this.onNearFastToggle,
    required this.onFiltersTap,
    required this.onOffersTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Row(
        children: [
          _Chip(icon: LucideIcons.slidersHorizontal, label: 'Filters', onTap: onFiltersTap),
          const SizedBox(width: AppSpacing.sm),
          _Chip(
            icon: LucideIcons.zap,
            label: 'Near & Fast',
            active: nearFastActive,
            onTap: () => onNearFastToggle(!nearFastActive),
          ),
          const SizedBox(width: AppSpacing.sm),
          _Chip(icon: LucideIcons.tag, label: 'Offers', onTap: onOffersTap),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _Chip({required this.icon, required this.label, this.active = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          decoration: BoxDecoration(
            color: active ? AppColors.primaryLight : AppColors.surface,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: active ? AppColors.primary : AppColors.cardBorder),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 14, color: active ? AppColors.primary : AppColors.textSecondary),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.caption.copyWith(
                    color: active ? AppColors.primary : AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}