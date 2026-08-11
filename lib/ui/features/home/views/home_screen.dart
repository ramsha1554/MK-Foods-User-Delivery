import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../orders/views/orders_screen.dart';
import '../../../../core/animations/app_durations.dart';
import '../../../../core/animations/app_fade_in.dart';
import '../../../../core/animations/app_scale_tap.dart';
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
import '../widgets/home_search_bar.dart';
import '../widgets/home_promo_banner.dart';
import '../widgets/home_category_chips.dart';
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
  String? _selectedCuisine;
  bool _nearFastActive = false;

  void _maybeFetchNearby(String? addressId, double lat, double lng) {
    if (addressId == null || addressId == _lastFetchedAddressId) return;
    _lastFetchedAddressId = addressId;
    ref.read(restaurantProvider.notifier).fetchNearby(
          latitude: lat, longitude: lng, cuisine: _selectedCuisine,
        );
  }

  void _onCategorySelected(String? cuisine, dynamic defaultAddress) {
    setState(() => _selectedCuisine = cuisine);
    if (defaultAddress?.location != null) {
      ref.read(restaurantProvider.notifier).fetchNearby(
            latitude: defaultAddress.location.coordinates[1],
            longitude: defaultAddress.location.coordinates[0],
            cuisine: cuisine,
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

  List<dynamic> _filteredRestaurants(RestaurantState state) {
    var list = List.of(state.restaurants);
    if (_searchQuery.trim().isNotEmpty) {
      final q = _searchQuery.trim().toLowerCase();
      list = list.where((r) => r.name.toLowerCase().contains(q)).toList();
    }
    if (_nearFastActive) {
      list.sort((a, b) => (a.preparationTime ?? 999).compareTo(b.preparationTime ?? 999));
    }
    return list;
  }

 
  Widget _buildDiscoveryBody(BuildContext context, dynamic defaultAddress, RestaurantState restaurantState) {
    final restaurants = _filteredRestaurants(restaurantState);
    final bool isFirstLoad = restaurantState.isLoading &&
        restaurantState.restaurants.isEmpty &&
        _selectedCuisine == null &&
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
          HomeCategoryChips(
            selectedCuisine: _selectedCuisine,
            onSelected: (cuisine) => _onCategorySelected(cuisine, defaultAddress),
            onMoreTap: () => _showComingSoon('More categories'),
          ),
          const SizedBox(height: AppSpacing.md),
          HomeFilterChips(
            nearFastActive: _nearFastActive,
            onNearFastToggle: (v) => setState(() => _nearFastActive = v),
            onFiltersTap: () => _showComingSoon('Filters'),
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
                    _selectedCuisine != null
                        ? 'No restaurants match "$_selectedCuisine" nearby'
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
