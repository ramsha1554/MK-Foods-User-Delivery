import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../models/menu_category.dart';

class MenuCategoryChips extends StatelessWidget {
  final List<MenuCategoryChip> categories;
  final bool isLoading;
  final String? selectedCategory;
  final ValueChanged<String?> onSelected;

  const MenuCategoryChips({
    super.key,
    required this.categories,
    required this.isLoading,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading && categories.isEmpty) {
      return SizedBox(
        height: 96,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          itemCount: 5,
          separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
          itemBuilder: (_, __) => const _ChipSkeleton(),
        ),
      );
    }

    if (categories.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        itemCount: categories.length + 1,
        separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _ChipItem(
              label: 'All',
              icon: LucideIcons.layoutGrid,
              selected: selectedCategory == null,
              onTap: () => onSelected(null),
            );
          }
          final category = categories[index - 1];
          final selected = category.name == selectedCategory;
          return _ChipItem(
            label: category.name,
            icon: LucideIcons.utensils,
            selected: selected,
            onTap: () => onSelected(selected ? null : category.name),
          );
        },
      ),
    );
  }
}

class _ChipItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  // eyebrow is 11px; locking an explicit height makes two lines (11 * 1.3 * 2)
  // a fixed value so every chip reserves the same label space regardless of
  // whether its name wraps to one line or two.
  static const double _labelLineHeight = 1.3;
  static const double _labelTwoLineHeight = 28.6;

  const _ChipItem({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: selected ? AppColors.primary : AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(icon, color: selected ? Colors.white : AppColors.primary),
            ),
            const SizedBox(height: AppSpacing.xs),
            SizedBox(
              height: _labelTwoLineHeight,
              child: Text(
                label,
                style: AppTextStyles.eyebrow.copyWith(height: _labelLineHeight),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChipSkeleton extends StatelessWidget {
  const _ChipSkeleton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(color: AppColors.cardBorder, shape: BoxShape.circle),
          ),
          const SizedBox(height: AppSpacing.xs),
          Container(width: 44, height: 8, color: AppColors.cardBorder),
        ],
      ),
    );
  }
}