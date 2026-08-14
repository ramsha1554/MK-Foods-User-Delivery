// import 'package:flutter/material.dart';
// import 'package:lucide_icons_flutter/lucide_icons.dart';

// import '../../../core/theme/app_colors.dart';
// import '../../../core/theme/app_spacing.dart';
// import '../../../core/theme/app_text_styles.dart';

// class RestaurantInfoBar extends StatelessWidget {
//   final double rating;
//   final int? deliveryTimeMinutes;
//   final double deliveryFee;
//   final double minimumOrder;

//   const RestaurantInfoBar({
//     super.key,
//     required this.rating,
//     required this.deliveryTimeMinutes,
//     required this.deliveryFee,
//     required this.minimumOrder,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: AppSpacing.md, horizontal: AppSpacing.sm),
//       decoration: BoxDecoration(
//         color: AppColors.surface,
//         borderRadius: BorderRadius.circular(AppRadius.lg),
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.shadow.withValues(alpha: 0.35),
//             blurRadius: 16,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           _InfoCell(icon: LucideIcons.star, iconColor: AppColors.rating, value: rating.toStringAsFixed(1), label: 'Rating'),
//           _CellDivider(),
//           _InfoCell(icon: LucideIcons.clock, iconColor: AppColors.primary, value: '${deliveryTimeMinutes ?? '-'} min', label: 'Delivery Time'),
//           _CellDivider(),
//           _InfoCell(icon: LucideIcons.bike, iconColor: AppColors.primary, value: '£${deliveryFee.toStringAsFixed(2)}', label: 'Delivery Fee'),
//           _CellDivider(),
//           _InfoCell(icon: LucideIcons.wallet, iconColor: AppColors.primary, value: 'Min £${minimumOrder.toStringAsFixed(2)}', label: 'Min. Order'),
//         ],
//       ),
//     );
//   }
// }

// class _InfoCell extends StatelessWidget {
//   final IconData icon;
//   final Color iconColor;
//   final String value;
//   final String label;

//   const _InfoCell({required this.icon, required this.iconColor, required this.value, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, size: 14, color: iconColor),
//           const SizedBox(height: 4),
//           FittedBox(child: Text(value, style: AppTextStyles.cardTitle.copyWith(fontSize: 11))),
//           const SizedBox(height: 2),
//           Text(label, style: AppTextStyles.caption.copyWith(fontSize: 9), textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis),
//         ],
//       ),
//     );
//   }
// }

// class _CellDivider extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(width: 1, height: 36, color: AppColors.divider);
//   }
// }

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';

class RestaurantInfoBar extends StatelessWidget {
  final double rating;
  final int? deliveryTimeMinutes;
  final double deliveryFee;
  final double minimumOrder;

  const RestaurantInfoBar({
    super.key,
    required this.rating,
    required this.deliveryTimeMinutes,
    required this.deliveryFee,
    required this.minimumOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm, horizontal: AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withValues(alpha: 0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          _InfoCell(icon: LucideIcons.star, iconColor: AppColors.rating, value: rating.toStringAsFixed(1), label: 'Rating'),
          _CellDivider(),
          _InfoCell(icon: LucideIcons.clock, iconColor: AppColors.primary, value: '${deliveryTimeMinutes ?? '-'} min', label: 'Delivery Time'),
          _CellDivider(),
          _InfoCell(icon: LucideIcons.bike, iconColor: AppColors.primary, value: '£${deliveryFee.toStringAsFixed(2)}', label: 'Delivery Fee'),
          _CellDivider(),
          _InfoCell(icon: LucideIcons.wallet, iconColor: AppColors.primary, value: 'Min £${minimumOrder.toStringAsFixed(2)}', label: 'Min. Order'),
        ],
      ),
    );
  }
}

class _InfoCell extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const _InfoCell({required this.icon, required this.iconColor, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 14, color: iconColor),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.cardTitle.copyWith(fontSize: 11),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          SizedBox(
            height: 22,
            child: Text(
              label,
              style: AppTextStyles.caption.copyWith(fontSize: 9),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _CellDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 36, color: AppColors.divider);
  }
}