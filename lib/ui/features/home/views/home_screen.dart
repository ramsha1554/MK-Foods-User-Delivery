import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../orders/views/orders_screen.dart';
import '../../../../core/animations/app_durations.dart';
import '../../../../core/animations/app_fade_in.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../profile/views/profile_screen.dart';
import '../../address/providers/address_provider.dart';
import '../../address/views/address_list_screen.dart';
import '../../auth/providers/auth_provider.dart';
import '../../auth/views/onboarding_screen.dart';
import '../../../../core/animations/app_page_transitions.dart';
import '../../restaurant/providers/restaurant_provider.dart';
import '../../restaurant/views/restaurant_detail_screen.dart';
import '../../restaurant/widgets/restaurant_card.dart';
import '../../../../core/utils/geo_utils.dart';
import '../models/filter_options.dart';
import '../providers/filter_provider.dart';
import '../providers/dish_category_provider.dart';
import '../widgets/filter_bottom_sheet.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/home_promo_banner.dart';
import '../widgets/dish_category_chips.dart';
import '../widgets/home_filter_chips.dart';
import '../widgets/home_bottom_nav.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String? _lastFetchedAddressId;
  final _searchController = TextEditingController();
  String _searchQuery = '';
  // A real menu-item name (e.g. "Butter Chicken"), computed from actual
  // nearby-restaurant menus — not a backend cuisine tag.
  String? _selectedDish;

  void _maybeFetchNearby(String? addressId, double lat, double lng) {
    if (addressId == null || addressId == _lastFetchedAddressId) return;
    _lastFetchedAddressId = addressId;
    ref.read(restaurantProvider.notifier).fetchNearby(
          latitude: lat,
          longitude: lng,
          radius: ref.read(filterProvider).radiusKm,
        );
  }

  // Purely client-side — selecting a dish chip filters the already-loaded
  // restaurant list (via dishCategoryProvider's restaurantIdsFor). No
  // backend call, no navigation to a food-item detail view.
  void _onDishSelected(String? dishName) {
    setState(() => _selectedDish = dishName);
  }

  Future<void> _openFilterSheet(dynamic defaultAddress) async {
    final current = ref.read(filterProvider);
    final availableCuisines = ref
        .read(restaurantProvider)
        .restaurants
        .expand((r) => r.cuisineType ?? const <String>[])
        .toSet()
        .toList()
      ..sort();

    final result = await showFilterBottomSheet(
      context,
      current: current,
      availableCuisines: availableCuisines,
    );
    if (result == null) return;

    final radiusChanged = result.radiusKm != current.radiusKm;
    ref.read(filterProvider.notifier).apply(result);

    if (radiusChanged && defaultAddress?.location != null) {
      ref.read(restaurantProvider.notifier).fetchNearby(
            latitude: defaultAddress.location.coordinates[1],
            longitude: defaultAddress.location.coordinates[0],
            radius: result.radiusKm,
          );
    }
  }

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$feature — coming soon')),
    );
  }

  String _firstName(String? fullName) {
    if (fullName == null || fullName.trim().isEmpty) return '';
    return fullName.trim().split(' ').first;
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    ref.listen<AuthState>(authProvider, (prev, next) {
      if (next.status == AuthStatus.unauthenticated) {
        Navigator.of(context).pushAndRemoveUntil(
          SlideUpPageRoute(page: const OnboardingScreen()),
          (route) => false,
        );
      }
    });

    final addressState = ref.watch(addressProvider);
    final restaurantState = ref.watch(restaurantProvider);
    final defaultAddress = addressState.defaultAddress;

    if (defaultAddress?.location != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _maybeFetchNearby(
          defaultAddress!.id,
          defaultAddress.location!.coordinates[1],
          defaultAddress.location!.coordinates[0],
        );
      });
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: HomeBottomNav(
        onOrdersTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const OrdersScreen()),
        ),
        onProfileTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ProfileScreen()),
        ),
        onUnavailableTap: () => _showComingSoon('This'),
      ),
      body: SafeArea(
        child: AppFadeIn(
          duration: AppDurations.hero,
          child: Column(
            children: [
              // ── Location header ──
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.md,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddressListScreen()),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(LucideIcons.mapPin, color: AppColors.primary, size: 18),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              defaultAddress != null
                                  ? 'DELIVERING TO · ${defaultAddress.label.toUpperCase()}'
                                  : 'SET DELIVERY ADDRESS',
                              style: AppTextStyles.eyebrow,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              defaultAddress?.fullAddress ?? 'Add an address to get started',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      const Icon(LucideIcons.chevronDown, color: AppColors.textSecondary, size: 18),
                    ],
                  ),
                ),
              ),

              // ── Greeting ──
              Padding(
                padding: const EdgeInsets.fromLTRB(AppSpacing.lg, 0, AppSpacing.lg, AppSpacing.lg),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authState.user?.name != null
                            ? 'Hey ${_firstName(authState.user!.name)},'
                            : 'Hey there,',
                        style: AppTextStyles.h1,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Let's get you something delicious!",
                        style: AppTextStyles.bodySecondary,
                      ),
                    ],
                  ),
                ),
              ),

              // ── Restaurant Discovery (scrollable body) ──
              Expanded(
                child: _buildBody(context, defaultAddress, restaurantState),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<dynamic> _filteredRestaurants(
    RestaurantState state,
    FilterOptions filters,
    dynamic defaultAddress,
    DishCategoryState dishState,
  ) {
    var list = List.of(state.restaurants);

    if (_searchQuery.trim().isNotEmpty) {
      final q = _searchQuery.trim().toLowerCase();
      list = list.where((r) => r.name.toLowerCase().contains(q)).toList();
    }

    if (_selectedDish != null) {
      final allowedIds = dishState.restaurantIdsFor(_selectedDish!);
      list = list.where((r) => allowedIds.contains(r.id)).toList();
    }

    if (filters.cuisines.isNotEmpty) {
      list = list.where((r) {
        final types = (r.cuisineType ?? const <String>[]).toSet();
        return types.intersection(filters.cuisines).isNotEmpty;
      }).toList();
    }

    if (filters.minRating != null) {
      list = list.where((r) => (r.averageRating ?? 0) >= filters.minRating!).toList();
    }

    if (filters.openNowOnly) {
      list = list.where((r) => r.isOpen ?? false).toList();
    }

    if (filters.freeDeliveryOnly) {
      list = list.where((r) => (r.deliveryFee ?? 0) == 0).toList();
    }

    switch (filters.sortBy) {
      case SortOption.ratingHighToLow:
        list.sort((a, b) => (b.averageRating ?? 0).compareTo(a.averageRating ?? 0));
        break;
      case SortOption.deliveryTimeFastest:
        list.sort((a, b) => (a.preparationTime ?? 999).compareTo(b.preparationTime ?? 999));
        break;
      case SortOption.distanceNearest:
        final coords = defaultAddress?.location?.coordinates;
        if (coords != null) {
          final userLat = coords[1] as double;
          final userLng = coords[0] as double;
          list.sort((a, b) {
            final aLoc = a.location?.coordinates;
            final bLoc = b.location?.coordinates;
            final aDist = aLoc != null ? distanceKm(userLat, userLng, aLoc[1], aLoc[0]) : double.infinity;
            final bDist = bLoc != null ? distanceKm(userLat, userLng, bLoc[1], bLoc[0]) : double.infinity;
            return aDist.compareTo(bDist);
          });
        }
        break;
      case SortOption.recommended:
        break;
    }

    return list;
  }

  Widget _buildDiscoveryBody(BuildContext context, dynamic defaultAddress, RestaurantState restaurantState) {
    final filters = ref.watch(filterProvider);
    final dishState = ref.watch(dishCategoryProvider);

    // Fire-and-forget: the notifier guards against duplicate runs and only
    // re-fetches when the restaurant set changes or the 15-min cache expires.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dishCategoryProvider.notifier).ensureFresh(restaurantState.restaurants);
    });

    final restaurants = _filteredRestaurants(restaurantState, filters, defaultAddress, dishState);
    final bool isFirstLoad = restaurantState.isLoading &&
        restaurantState.restaurants.isEmpty &&
        _selectedDish == null &&
        _searchQuery.isEmpty;

    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: () async {
        _lastFetchedAddressId = null;
        _maybeFetchNearby(
          defaultAddress.id,
          defaultAddress.location!.coordinates[1],
          defaultAddress.location!.coordinates[0],
        );
      },
      child: ListView(
        padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: HomeSearchBar(
              controller: _searchController,
              onChanged: (v) => setState(() => _searchQuery = v),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: HomePromoBanner(),
          ),
          const SizedBox(height: AppSpacing.lg),
          DishCategoryChips(
            dishes: dishState.dishes,
            isLoading: dishState.isLoading,
            selectedDish: _selectedDish,
            onSelected: _onDishSelected,
          ),
          const SizedBox(height: AppSpacing.md),
          HomeFilterChips(
            activeFilterCount: filters.activeCount,
            onFiltersTap: () => _openFilterSheet(defaultAddress),
            onOffersTap: () => _showComingSoon('Offers'),
          ),
          const SizedBox(height: AppSpacing.lg),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Top restaurants near you', style: AppTextStyles.h2),
                Text('See all', style: AppTextStyles.bodySecondary.copyWith(color: AppColors.primary)),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          if (isFirstLoad)
            const Padding(
              padding: EdgeInsets.all(AppSpacing.xxl),
              child: Center(child: CircularProgressIndicator(color: AppColors.primary)),
            )
          else if (restaurantState.errorMessage != null && restaurantState.restaurants.isEmpty)
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xxl),
              child: Column(
                children: [
                  const Icon(LucideIcons.wifiOff, color: AppColors.primary, size: 28),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    restaurantState.errorMessage!,
                    style: AppTextStyles.bodySecondary,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          else if (restaurants.isEmpty)
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xxl),
              child: Column(
                children: [
                  const Icon(LucideIcons.utensils, color: AppColors.primary, size: 28),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    _selectedDish != null
                        ? 'No restaurants serve "$_selectedDish" nearby'
                        : (_searchQuery.isNotEmpty
                            ? 'No matches for "$_searchQuery"'
                            : 'No restaurants nearby yet'),
                    style: AppTextStyles.bodySecondary,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: restaurants.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppSpacing.md,
                  crossAxisSpacing: AppSpacing.md,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return RestaurantCard(
                    restaurant: restaurant,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => RestaurantDetailScreen(restaurantId: restaurant.id)),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, dynamic defaultAddress, RestaurantState restaurantState) {
    if (defaultAddress == null) {
      return _EmptyState(
        icon: LucideIcons.mapPin,
        title: 'Add a delivery address',
        message: 'We need your address to show restaurants near you.',
      );
    }

    return _buildDiscoveryBody(context, defaultAddress, restaurantState);
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;

  const _EmptyState({required this.icon, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: const BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle),
              child: Icon(icon, color: AppColors.primary, size: 28),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(title, style: AppTextStyles.h2, textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.xs),
            Text(message, style: AppTextStyles.bodySecondary, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}