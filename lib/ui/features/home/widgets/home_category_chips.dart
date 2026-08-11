import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';

class HomeCategory {
  final String label;
  final String? svgAsset;
  final IconData? fallbackIcon;
  /// Value passed to restaurantProvider.fetchNearby(cuisine: ...). Null = All.
  final String? cuisineValue;

  const HomeCategory({
    required this.label,
    this.svgAsset,
    this.fallbackIcon,
    this.cuisineValue,
  });
}

// Static list — no categories API exists. cuisineValue feeds directly into
// the existing restaurantProvider.fetchNearby(cuisine: ...) param.
const List<HomeCategory> homeCategories = [
  HomeCategory(label: 'All', svgAsset: 'assets/icons/menu.svg', cuisineValue: null),
  HomeCategory(label: 'Biryani', fallbackIcon: LucideIcons.utensils, cuisineValue: 'Biryani'),
  HomeCategory(label: 'Pizza', svgAsset: 'assets/icons/pizza.svg', cuisineValue: 'Pizza'),
  HomeCategory(label: 'Burger', svgAsset: 'assets/icons/fast food.svg', cuisineValue: 'Burger'),
  HomeCategory(label: 'Chicken', fallbackIcon: LucideIcons.utensils, cuisineValue: 'Chicken'),
];

class HomeCategoryChips extends StatelessWidget {
  final String? selectedCuisine;
  final ValueChanged<String?> onSelected;
  final VoidCallback onMoreTap;

  const HomeCategoryChips({
    super.key,
    required this.selectedCuisine,
    required this.onSelected,
    required this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        itemCount: homeCategories.length + 1, // +1 for "More"
        separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
        itemBuilder: (context, index) {
          if (index == homeCategories.length) {
            return _CategoryItem(
              label: 'More',
              fallbackIcon: LucideIcons.utensils,
              selected: false,
              onTap: onMoreTap,
            );
          }
          final cat = homeCategories[index];
          final selected = cat.cuisineValue == selectedCuisine;
          return _CategoryItem(
            label: cat.label,
            svgAsset: cat.svgAsset,
            fallbackIcon: cat.fallbackIcon,
            selected: selected,
            onTap: () => onSelected(selected ? null : cat.cuisineValue),
          );
        },
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String label;
  final String? svgAsset;
  final IconData? fallbackIcon;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryItem({
    required this.label,
    this.svgAsset,
    this.fallbackIcon,
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
            padding: const EdgeInsets.all(14),
            child: svgAsset != null
                ? SvgPicture.asset(
                    svgAsset!,
                    colorFilter: ColorFilter.mode(
                      selected ? Colors.white : AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  )
                : Icon(fallbackIcon, color: selected ? Colors.white : AppColors.primary),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(label, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}