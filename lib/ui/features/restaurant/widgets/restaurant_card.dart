


import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/animations/app_scale_tap.dart';
import '../../../../data/models/customer_models.dart';
import '../../../core/theme/app_avatar_sizes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/media_url.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final VoidCallback onTap;

  const RestaurantCard({super.key, required this.restaurant, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isOpen = restaurant.isOpen ?? false;
    final isBusy = restaurant.isBusy ?? false;
    final imageUrl = resolveMediaUrl(restaurant.coverImage ?? restaurant.logo);

    return AppScaleTap(
      scale: 0.98,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 11,
                  child: _RestaurantImage(imageUrl: imageUrl, name: restaurant.name),
                ),
                Positioned(
                  top: AppSpacing.sm,
                  right: AppSpacing.sm,
                  child: _StatusBadge(isOpen: isOpen, isBusy: isBusy),
                ),
                Positioned(
                  bottom: -18,
                  left: AppSpacing.md,
                  child: _RestaurantAvatar(imageUrl: imageUrl, name: restaurant.name),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md, 22, AppSpacing.md, AppSpacing.md,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.cardTitle,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const Icon(LucideIcons.star, size: 13, color: AppColors.rating),
                        const SizedBox(width: 3),
                        Text((restaurant.averageRating ?? 0).toStringAsFixed(1), style: AppTextStyles.caption),
                        _MetaDivider(),
                        Text('${restaurant.preparationTime ?? '-'} min', style: AppTextStyles.caption),
                        _MetaDivider(),
                        Text('£${(restaurant.deliveryFee ?? 0).toStringAsFixed(2)}', style: AppTextStyles.caption),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RestaurantImage extends StatelessWidget {
  final String? imageUrl;
  final String name;

  const _RestaurantImage({required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return Container(color: AppColors.primaryLight);
    }
    return Image.network(
      imageUrl!,
      fit: BoxFit.cover,
      width: double.infinity,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Container(
          color: AppColors.primaryLight,
          alignment: Alignment.center,
          child: const SizedBox(
            width: 18, height: 18,
            child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) => Container(color: AppColors.primaryLight),
    );
  }
}

class _RestaurantAvatar extends StatelessWidget {
  final String? imageUrl;
  final String name;

  const _RestaurantAvatar({required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40, height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.surface,
        border: Border.all(color: AppColors.surface, width: 2),
        boxShadow: const [BoxShadow(color: AppColors.shadow, blurRadius: 4, offset: Offset(0, 2))],
      ),
      clipBehavior: Clip.antiAlias,
      child: (imageUrl != null && imageUrl!.isNotEmpty)
          ? Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _AvatarLetter(name: name),
            )
          : _AvatarLetter(name: name),
    );
  }
}

class _AvatarLetter extends StatelessWidget {
  final String name;
  const _AvatarLetter({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryLight,
      alignment: Alignment.center,
      child: Text(
        name.trim().isNotEmpty ? name.trim()[0].toUpperCase() : '?',
        style: const TextStyle(fontSize: AppAvatarSizes.initialSmall, fontWeight: FontWeight.w800, color: AppColors.primary),
      ),
    );
  }
}

class _MetaDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Text('·', style: TextStyle(color: AppColors.textHint, fontWeight: FontWeight.bold)),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final bool isOpen;
  final bool isBusy;

  const _StatusBadge({required this.isOpen, required this.isBusy});

  @override
  Widget build(BuildContext context) {
    final String label = !isOpen ? 'Closed' : (isBusy ? 'Busy' : 'Open');
    final Color color = !isOpen ? AppColors.error : (isBusy ? AppColors.warning : AppColors.success);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label, style: AppTextStyles.badge.copyWith(color: color)),
    );
  }
}