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
import '../widgets/restaurant_info_bar.dart';
import '../widgets/menu_category_nav.dart';

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

class _RestaurantDetailBody extends StatefulWidget {
  final RestaurantDetail detail;

  const _RestaurantDetailBody({required this.detail});

  @override
  State<_RestaurantDetailBody> createState() => _RestaurantDetailBodyState();
}

class _RestaurantDetailBodyState extends State<_RestaurantDetailBody> {
  // UI-only for now — no favourites endpoint exists on the backend yet.
  // Wire this to a real API call once CustomerRepository exposes one.


  int _selectedCategoryIndex = 0;

  void _selectCategory(int index) {
    setState(() => _selectedCategoryIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = widget.detail.restaurant;
    final isOpen = restaurant.isOpen ?? false;
    final imageUrl = resolveMediaUrl(restaurant.coverImage ?? restaurant.logo);
    final categoryNames = widget.detail.menu.map((c) => c.name).toList();
    final heroHeight = MediaQuery.of(context).size.height * 0.42;

    return CustomScrollView(
      slivers: [
        // ── Hero image with overlapping info card ──
        SliverToBoxAdapter(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: heroHeight,
                width: double.infinity,
                child: (imageUrl != null && imageUrl.isNotEmpty)
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _HeroFallback(name: restaurant.name),
                      )
                    : _HeroFallback(name: restaurant.name),
              ),
              // Top scrim so the back/favorite buttons stay legible on any photo.
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 90,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.scrim, Colors.transparent],
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
                  child: _HeroIconButton(
                    icon: LucideIcons.arrowLeft,
                    onTap: () => Navigator.of(context).maybePop(),
                  ),
                ),
              ),
            
              Positioned(
                left: AppSpacing.lg,
                right: AppSpacing.lg,
                bottom: -36,
                child: RestaurantInfoBar(
                  rating: restaurant.averageRating ?? 0,
                  deliveryTimeMinutes: restaurant.preparationTime,
                  deliveryFee: restaurant.deliveryFee ?? 0,
                  minimumOrder: restaurant.minimumOrder ?? 0,
                ),
              ),
            ],
          ),
        ),

        // Space reserved for the overlapping card above (36 tall + gap).
        const SliverToBoxAdapter(child: SizedBox(height: 56)),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.lg, 0, AppSpacing.lg, AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if ((restaurant.cuisineType ?? []).isNotEmpty) ...[
                  Row(
                    children: [
                      const Icon(LucideIcons.leaf, size: 14, color: AppColors.textSecondary),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(restaurant.cuisineType!.join(' · '), style: AppTextStyles.bodySecondary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                ],
                if (restaurant.description != null)
                  Text(restaurant.description!, style: AppTextStyles.body),
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

        if (categoryNames.isNotEmpty)
          SliverToBoxAdapter(
            child: MenuCategoryNav(
              categories: categoryNames,
              selectedIndex: _selectedCategoryIndex,
              onSelected: _selectCategory,
            ),
          ),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.sm)),
        const SliverToBoxAdapter(child: Divider(height: 1, color: AppColors.divider)),

        if (widget.detail.menu.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.lg, AppSpacing.lg, AppSpacing.sm),
              child: Text(widget.detail.menu[_selectedCategoryIndex].name, style: AppTextStyles.h2),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _MenuItemTile(
                item: widget.detail.menu[_selectedCategoryIndex].items[index],
                restaurant: restaurant,
              ),
              childCount: widget.detail.menu[_selectedCategoryIndex].items.length,
            ),
          ),
        ],
        const SliverToBoxAdapter(child: SizedBox(height: 90)),
      ],
    );
  }
}

class _HeroIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  const _HeroIconButton({
    required this.icon,
    this.iconColor = AppColors.textPrimary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.surface.withValues(alpha: 0.92),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: AppColors.shadow.withValues(alpha: 0.3), blurRadius: 6),
          ],
        ),
        child: Icon(icon, size: 18, color: iconColor),
      ),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.md),
              child: Container(
                width: 96,
                height: 96,
                color: AppColors.primaryLight,
                child: resolveMediaUrl(item.image) != null
                    ? Image.network(
                        resolveMediaUrl(item.image)!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(LucideIcons.utensils, color: AppColors.primary, size: 26),
                      )
                    : const Icon(LucideIcons.utensils, color: AppColors.primary, size: 26),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('£${item.price.toStringAsFixed(2)}', style: AppTextStyles.priceAccent),
                      if (!item.isAvailable)
                        const Text('Sold out',
                            style: TextStyle(fontSize: 10, color: AppColors.error, fontWeight: FontWeight.w700))
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