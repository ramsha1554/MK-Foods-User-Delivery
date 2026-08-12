import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';

/// "Offers" stays a UI-only placeholder — no offers/promo model exists on
/// the backend yet. "Filters" is now real: it opens the Sort & Filter
/// sheet and shows a badge for how many filters are currently active.
class HomeFilterChips extends StatelessWidget {
  final int activeFilterCount;
  final VoidCallback onFiltersTap;
  final VoidCallback onOffersTap;

  const HomeFilterChips({
    super.key,
    required this.activeFilterCount,
    required this.onFiltersTap,
    required this.onOffersTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Row(
        children: [
          _Chip(
            icon: LucideIcons.slidersHorizontal,
            label: activeFilterCount > 0 ? 'Filters ($activeFilterCount)' : 'Sort & Filter',
            active: activeFilterCount > 0,
            onTap: onFiltersTap,
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