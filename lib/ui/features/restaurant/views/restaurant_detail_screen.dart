import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../data/models/customer_models.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../cart/providers/cart_provider.dart';
import '../../cart/widgets/cart_bottom_sheet.dart';
import '../providers/restaurant_provider.dart';
import '../../../../core/utils/media_url.dart';

class RestaurantDetailScreen extends ConsumerWidget {
  final String restaurantId;

  const RestaurantDetailScreen({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(restaurantDetailProvider(restaurantId));

    return Scaffold(
      backgroundColor: AppColors.background,
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
        error: (err, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.xxl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(LucideIcons.circleAlert, color: AppColors.error, size: 40),
                const SizedBox(height: AppSpacing.md),
                Text(
                  err.toString().replaceAll('Exception: ', ''),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySecondary,
                ),
                const SizedBox(height: AppSpacing.lg),
                ElevatedButton(
                  onPressed: () => ref.refresh(restaurantDetailProvider(restaurantId)),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (detail) => _RestaurantDetailBody(detail: detail),
      ),
      bottomNavigationBar: const CartBottomBar(),
    );
  }
}

class _RestaurantDetailBody extends StatelessWidget {
  final RestaurantDetail detail;

  const _RestaurantDetailBody({required this.detail});

  @override
  Widget build(BuildContext context) {
    final restaurant = detail.restaurant;
    final isOpen = restaurant.isOpen ?? false;
    final imageUrl = resolveMediaUrl(restaurant.coverImage ?? restaurant.logo);

    return CustomScrollView(
      slivers: [
        // ── Hero header ──
        SliverAppBar(
          pinned: true,
          expandedHeight: 200,
          backgroundColor: AppColors.surface,
          foregroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(left: 56, right: 16, bottom: 14),
            title: Text(
              restaurant.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
            ),
            background: Stack(
              fit: StackFit.expand,
              children: [
                (imageUrl != null && imageUrl.isNotEmpty)
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _HeroFallback(name: restaurant.name),
                      )
                    : _HeroFallback(name: restaurant.name),
                // Scrim so the title stays legible over any photo.
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, AppColors.scrim],
                      stops: [0.4, 1.0],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if ((restaurant.cuisineType ?? []).isNotEmpty) ...[
                  Text(restaurant.cuisineType!.join(' · '), style: AppTextStyles.bodySecondary),
                  const SizedBox(height: 6),
                ],
                if (restaurant.description != null) ...[
                  Text(restaurant.description!, style: AppTextStyles.body),
                  const SizedBox(height: AppSpacing.md),
                ],
                Row(
                  children: [
                    const Icon(LucideIcons.star, size: 14, color: AppColors.rating),
                    const SizedBox(width: 4),
                    Text((restaurant.averageRating ?? 0).toStringAsFixed(1), style: AppTextStyles.caption),
                    _MetaDivider(),
                    const Icon(LucideIcons.clock, size: 14, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Text('${restaurant.preparationTime ?? '-'} min', style: AppTextStyles.caption),
                    _MetaDivider(),
                    const Icon(LucideIcons.bike, size: 14, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Text('£${(restaurant.deliveryFee ?? 0).toStringAsFixed(2)}', style: AppTextStyles.caption),
                    _MetaDivider(),
                    Text('Min £${(restaurant.minimumOrder ?? 0).toStringAsFixed(2)}', style: AppTextStyles.caption),
                  ],
                ),
                if (!isOpen) ...[
                  const SizedBox(height: AppSpacing.md),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.error.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'This restaurant is currently closed.',
                      style: TextStyle(color: AppColors.error, fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: Divider(height: 1, color: AppColors.divider)),

        for (final category in detail.menu) ...[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.lg, AppSpacing.lg, AppSpacing.sm),
              child: Text(category.name, style: AppTextStyles.h2),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _MenuItemTile(item: category.items[index], restaurant: restaurant),
              childCount: category.items.length,
            ),
          ),
        ],
        const SliverToBoxAdapter(child: SizedBox(height: 90)),
      ],
    );
  }
}

class _HeroFallback extends StatelessWidget {
  final String name;
  const _HeroFallback({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryLight,
      alignment: Alignment.center,
      child: Text(
        name.trim().isEmpty ? '?' : name.trim()[0].toUpperCase(),
        style: const TextStyle(fontSize: 56, fontWeight: FontWeight.w800, color: AppColors.primary),
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

class _MenuItemTile extends ConsumerWidget {
  final MenuItem item;
  final Restaurant restaurant;

  const _MenuItemTile({required this.item, required this.restaurant});

  Future<void> _handleAdd(BuildContext context, WidgetRef ref) async {
    final notifier = ref.read(cartProvider.notifier);

    if (notifier.hasConflict(restaurant.id)) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Start a new cart?'),
          content: Text(
            'Your cart has items from ${ref.read(cartProvider).restaurantName ?? 'another restaurant'}. '
            'Adding this item will clear your current cart.',
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
            TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Clear & Add')),
          ],
        ),
      );
      if (confirmed != true) return;
      notifier.clearCart();
    }

    notifier.addItem(
      menuItem: item,
      restaurantId: restaurant.id,
      restaurantName: restaurant.name,
      minimumOrder: restaurant.minimumOrder,
      deliveryFee: restaurant.deliveryFee,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final inCart = cart.restaurantId == restaurant.id
        ? cart.items.where((c) => c.menuItem.id == item.id).firstOrNull
        : null;

    return Opacity(
      opacity: item.isAvailable ? 1 : 0.5,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: 6),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: AppTextStyles.cardTitle),
                  if (item.description != null) ...[
                    const SizedBox(height: 3),
                    Text(
                      item.description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodySecondary,
                    ),
                  ],
                  const SizedBox(height: AppSpacing.sm),
                  Text('£${item.price.toStringAsFixed(2)}', style: AppTextStyles.priceAccent),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 72,
                    height: 72,
                    color: AppColors.primaryLight,
                    child: resolveMediaUrl(item.image) != null
                        ? Image.network(
                            resolveMediaUrl(item.image)!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                const Icon(LucideIcons.utensils, color: AppColors.primary, size: 22),
                          )
                        : const Icon(LucideIcons.utensils, color: AppColors.primary, size: 22),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                if (!item.isAvailable)
                  const Text('Sold out', style: TextStyle(fontSize: 10, color: AppColors.error, fontWeight: FontWeight.w700))
                else if (inCart == null)
                  _AddButton(onTap: () => _handleAdd(context, ref))
                else
                  _QuantityStepper(
                    quantity: inCart.quantity,
                    onDecrement: () =>
                        ref.read(cartProvider.notifier).updateQuantity(item.id, inCart.quantity - 1),
                    onIncrement: () =>
                        ref.read(cartProvider.notifier).updateQuantity(item.id, inCart.quantity + 1),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final VoidCallback onTap;
  const _AddButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(vertical: 7),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'ADD',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: 0.4),
        ),
      ),
    );
  }
}

class _QuantityStepper extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const _QuantityStepper({required this.quantity, required this.onDecrement, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _StepperButton(icon: LucideIcons.minus, onTap: onDecrement),
          Text('$quantity', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)),
          _StepperButton(icon: LucideIcons.plus, onTap: onIncrement),
        ],
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _StepperButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Icon(icon, size: 13, color: Colors.white),
      ),
    );
  }
}