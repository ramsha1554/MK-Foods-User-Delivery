import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/locator.dart';
import '../../../../data/models/customer_models.dart';
import '../../../../data/repositories/customer_repository.dart';

class RestaurantState {
  final List<Restaurant> restaurants;
  final bool isLoading;
  final String? errorMessage;

  const RestaurantState({
    this.restaurants = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  RestaurantState copyWith({
    List<Restaurant>? restaurants,
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return RestaurantState(
      restaurants: restaurants ?? this.restaurants,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class RestaurantNotifier extends StateNotifier<RestaurantState> {
  final CustomerRepository _repository;

  RestaurantNotifier(this._repository) : super(const RestaurantState());

  Future<void> fetchNearby({
    required double latitude,
    required double longitude,
    String? cuisine,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final response = await _repository.getNearbyRestaurants(
        latitude: latitude,
        longitude: longitude,
        cuisine: cuisine,
      );
      final list = (response.data as List<dynamic>)
          .map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList();
      state = state.copyWith(restaurants: list, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString().replaceAll('Exception: ', ''),
      );
    }
  }
}

final restaurantProvider =
    StateNotifierProvider<RestaurantNotifier, RestaurantState>((ref) {
  return RestaurantNotifier(locator<CustomerRepository>());
});

/// Fetches a single restaurant's full profile + menu by id.
final restaurantDetailProvider =
    FutureProvider.family<RestaurantDetail, String>((ref, id) {
  return locator<CustomerRepository>().getRestaurantDetail(id);
});