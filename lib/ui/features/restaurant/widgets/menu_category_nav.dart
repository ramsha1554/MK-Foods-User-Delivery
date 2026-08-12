import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';

class MenuCategoryNav extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const MenuCategoryNav({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: AppSpacing.lg, bottom: AppSpacing.sm),
          child: Text('MENU', style: AppTextStyles.eyebrow),
        ),
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
            itemBuilder: (context, index) {
              final selected = index == selectedIndex;
              return _CategoryChip(label: categories[index], selected: selected, onTap: () => onSelected(index));
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryChip({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
        decoration: BoxDecoration(
          color: selected ? AppColors.textPrimary : AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: Border.all(color: selected ? AppColors.textPrimary : AppColors.cardBorder),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: AppTextStyles.bodySecondary.copyWith(color: selected ? Colors.white : AppColors.textPrimary, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}