import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/animations/app_scale_tap.dart';
import '../../../../data/models/customer_models.dart';
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
        margin: const EdgeInsets.fromLTRB(AppSpacing.lg, 0, AppSpacing.lg, AppSpacing.md),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _RestaurantThumbnail(imageUrl: imageUrl, name: restaurant.name),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          restaurant.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.cardTitle,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      _StatusBadge(isOpen: isOpen, isBusy: isBusy),
                    ],
                  ),
                  if ((restaurant.cuisineType ?? []).isNotEmpty) ...[
                    const SizedBox(height: 3),
                    Text(
                      restaurant.cuisineType!.join(' · '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodySecondary,
                    ),
                  ],
              const SizedBox(height: AppSpacing.sm),
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

/// Restaurant image slot. Renders the real cover photo when the backend
/// provides one; otherwise falls back to a monogram-style placeholder
/// (restaurant's initial letter) instead of a repeated generic icon —
/// this reads as "no photo yet" rather than "broken" or "templated,"
/// and every restaurant gets a visually distinct fallback.
class _RestaurantThumbnail extends StatelessWidget {
  final String? imageUrl;
  final String name;

  const _RestaurantThumbnail({required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        width: 76,
        height: 76,
        child: (imageUrl != null && imageUrl!.isNotEmpty)
            ? Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const _ThumbnailPlaceholder(letter: null);
                },
                errorBuilder: (context, error, stackTrace) => _ThumbnailPlaceholder(letter: name),
              )
            : _ThumbnailPlaceholder(letter: name),
      ),
    );
  }
}

class _ThumbnailPlaceholder extends StatelessWidget {
  final String? letter;

  const _ThumbnailPlaceholder({required this.letter});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryLight,
      alignment: Alignment.center,
      child: (letter == null || letter!.isEmpty)
          ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary),
            )
          : Text(
              letter!.trim()[0].toUpperCase(),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              ),
            ),
    );
  }
}

class _MetaDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
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
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label, style: AppTextStyles.badge.copyWith(color: color)),
    );
  }
}