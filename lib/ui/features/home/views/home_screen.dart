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

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   String? _lastFetchedAddressId;

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String? _lastFetchedAddressId;
  final _searchController = TextEditingController();
  String _searchQuery = '';
  String? _selectedCuisine;  

  void _maybeFetchNearby(String? addressId, double lat, double lng) {
    if (addressId == null || addressId == _lastFetchedAddressId) return;
    _lastFetchedAddressId = addressId;
    ref.read(restaurantProvider.notifier).fetchNearby(latitude: lat, longitude: lng);
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
      body: SafeArea(
        child: AppFadeIn(
          duration: AppDurations.hero,
          child: Column(
            children: [
              // ── Top bar: address (primary) + logout (secondary, low-emphasis) ──
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg, AppSpacing.md, AppSpacing.sm, AppSpacing.md,
                ),
                child: Row(
                  children: [
                    Expanded(
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
                    const SizedBox(width: AppSpacing.sm),
                  AppScaleTap(
                      scale: 0.94,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const OrdersScreen()),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.cardBorder),
                        ),
                        child: const Icon(LucideIcons.receipt, size: 18, color: AppColors.textSecondary),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    AppScaleTap(
                      scale: 0.94,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProfileScreen()),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.cardBorder),
                        ),
                        child: const Icon(LucideIcons.user, size: 18, color: AppColors.textSecondary),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                  ],
                ),
              ),

              // ── Greeting ──
              Padding(
                padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.sm, AppSpacing.lg, AppSpacing.lg),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    authState.user?.name != null
                        ? 'Hey ${_firstName(authState.user!.name)}, what are you craving?'
                        : 'What are you craving today?',
                    style: AppTextStyles.h1,
                  ),
                ),
              ),

              const Divider(height: 1, color: AppColors.divider),

              // ── Restaurant Discovery ──
              Expanded(child: _buildBody(context, defaultAddress, restaurantState)),
            ],
          ),
        ),
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

    if (restaurantState.isLoading && restaurantState.restaurants.isEmpty) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primary));
    }

    if (restaurantState.errorMessage != null && restaurantState.restaurants.isEmpty) {
      return _EmptyState(
        icon: LucideIcons.wifiOff,
        title: 'Something went wrong',
        message: restaurantState.errorMessage!,
      );
    }

    if (restaurantState.restaurants.isEmpty) {
      return const _EmptyState(
        icon: LucideIcons.utensils,
        title: 'No restaurants nearby',
        message: 'We couldn\'t find any restaurants delivering to this address yet.',
      );
    }

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
        padding: const EdgeInsets.only(top: AppSpacing.lg, bottom: AppSpacing.xxl),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Text('Restaurants near you', style: AppTextStyles.h2),
          ),
          const SizedBox(height: AppSpacing.sm),
          for (final restaurant in restaurantState.restaurants)
            RestaurantCard(
              restaurant: restaurant,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RestaurantDetailScreen(restaurantId: restaurant.id)),
              ),
            ),
        ],
      ),
    );
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