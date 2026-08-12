import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/customer_models.dart';
import '../../restaurant/providers/restaurant_provider.dart';
import '../models/dish_category.dart';

class DishCategoryState {
  final List<DishCategory> dishes;
  final bool isLoading;
  final String? cacheKey;
  final DateTime? computedAt;

  const DishCategoryState({
    this.dishes = const [],
    this.isLoading = false,
    this.cacheKey,
    this.computedAt,
  });

  DishCategoryState copyWith({
    List<DishCategory>? dishes,
    bool? isLoading,
    String? cacheKey,
    DateTime? computedAt,
  }) {
    return DishCategoryState(
      dishes: dishes ?? this.dishes,
      isLoading: isLoading ?? this.isLoading,
      cacheKey: cacheKey ?? this.cacheKey,
      computedAt: computedAt ?? this.computedAt,
    );
  }

  Set<String> restaurantIdsFor(String dishName) {
    for (final d in dishes) {
      if (d.name.toLowerCase() == dishName.toLowerCase()) return d.restaurantIds;
    }
    return const {};
  }
}

class DishCategoryNotifier extends StateNotifier<DishCategoryState> {
  final Ref _ref;
  static const _ttl = Duration(minutes: 15);
  static const _topN = 12;

  DishCategoryNotifier(this._ref) : super(const DishCategoryState());

  Future<void> ensureFresh(List<Restaurant> restaurants) async {
    if (restaurants.isEmpty || state.isLoading) return;

    final key = (restaurants.map((r) => r.id).toList()..sort()).join(',');
    final isFresh = state.cacheKey == key &&
        state.computedAt != null &&
        DateTime.now().difference(state.computedAt!) < _ttl;
    if (isFresh) return;

    state = state.copyWith(isLoading: true);

    final results = await Future.wait(restaurants.map((r) async {
      try {
        return await _ref.read(restaurantDetailProvider(r.id).future);
      } catch (_) {
        return null;
      }
    }));

    final counts = <String, int>{};
    final displayNames = <String, String>{};
    final restaurantIdsByName = <String, Set<String>>{};

    for (final detail in results) {
      if (detail == null) continue;
      final restaurantId = detail.restaurant.id;

      for (final category in detail.menu) {
        for (final item in category.items) {
          if (!item.isAvailable) continue;
          final trimmed = item.name.trim();
          if (trimmed.isEmpty) continue;
          final lower = trimmed.toLowerCase();

          restaurantIdsByName.putIfAbsent(lower, () => {});
          final alreadyCountedForThisRestaurant =
              restaurantIdsByName[lower]!.contains(restaurantId);
          restaurantIdsByName[lower]!.add(restaurantId);
          displayNames.putIfAbsent(lower, () => trimmed);
          if (!alreadyCountedForThisRestaurant) {
            counts[lower] = (counts[lower] ?? 0) + 1;
          }
        }
      }
    }

    final sorted = counts.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    final top = sorted.take(_topN).map((e) {
      return DishCategory(
        name: displayNames[e.key]!,
        restaurantIds: restaurantIdsByName[e.key]!,
      );
    }).toList();

    state = state.copyWith(
      dishes: top,
      isLoading: false,
      cacheKey: key,
      computedAt: DateTime.now(),
    );
  }
}

final dishCategoryProvider = StateNotifierProvider<DishCategoryNotifier, DishCategoryState>(
  (ref) => DishCategoryNotifier(ref),
);