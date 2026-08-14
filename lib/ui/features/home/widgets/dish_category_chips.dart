import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../models/dish_category.dart';

class DishCategoryChips extends StatelessWidget {
  final List<DishCategory> dishes;
  final bool isLoading;
  final String? selectedDish;
  final ValueChanged<String?> onSelected;

  const DishCategoryChips({
    super.key,
    required this.dishes,
    required this.isLoading,
    required this.selectedDish,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading && dishes.isEmpty) {
      return SizedBox(
        height: 84,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          itemCount: 5,
          separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
          itemBuilder: (_, __) => const _ChipSkeleton(),
        ),
      );
    }

    if (dishes.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 84,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        itemCount: dishes.length + 1,
        separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _ChipItem(
              label: 'All',
              icon: LucideIcons.layoutGrid,
              selected: selectedDish == null,
              onTap: () => onSelected(null),
            );
          }
          final dish = dishes[index - 1];
          final selected = dish.name == selectedDish;
          return _ChipItem(
            label: dish.name,
            icon: LucideIcons.utensils,
            selected: selected,
            onTap: () => onSelected(selected ? null : dish.name),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          Text(
            label,
            style: AppTextStyles.eyebrow,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ChipSkeleton extends StatelessWidget {
  const _ChipSkeleton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(color: AppColors.cardBorder, shape: BoxShape.circle),
          ),
          const SizedBox(height: AppSpacing.xs),
          Container(width: 40, height: 8, color: AppColors.cardBorder),
        ],
      ),
    );
  }
}