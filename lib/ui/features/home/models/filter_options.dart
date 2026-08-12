enum SortOption { recommended, ratingHighToLow, deliveryTimeFastest, distanceNearest }

extension SortOptionLabel on SortOption {
  String get label {
    switch (this) {
      case SortOption.recommended:
        return 'Recommended';
      case SortOption.ratingHighToLow:
        return 'Rating: High to Low';
      case SortOption.deliveryTimeFastest:
        return 'Delivery Time: Fastest';
      case SortOption.distanceNearest:
        return 'Distance: Nearest';
    }
  }
}

class FilterOptions {
  final SortOption sortBy;
  final double? minRating; // null = no rating filter
  final bool openNowOnly;
  final bool freeDeliveryOnly;
  final Set<String> cuisines; // client-side multi-select, OR-matched
  final double radiusKm;

  const FilterOptions({
    this.sortBy = SortOption.recommended,
    this.minRating,
    this.openNowOnly = false,
    this.freeDeliveryOnly = false,
    this.cuisines = const {},
    this.radiusKm = 5,
  });

  FilterOptions copyWith({
    SortOption? sortBy,
    double? minRating,
    bool clearMinRating = false,
    bool? openNowOnly,
    bool? freeDeliveryOnly,
    Set<String>? cuisines,
    double? radiusKm,
  }) {
    return FilterOptions(
      sortBy: sortBy ?? this.sortBy,
      minRating: clearMinRating ? null : (minRating ?? this.minRating),
      openNowOnly: openNowOnly ?? this.openNowOnly,
      freeDeliveryOnly: freeDeliveryOnly ?? this.freeDeliveryOnly,
      cuisines: cuisines ?? this.cuisines,
      radiusKm: radiusKm ?? this.radiusKm,
    );
  }

  int get activeCount {
    var count = 0;
    if (minRating != null) count++;
    if (openNowOnly) count++;
    if (freeDeliveryOnly) count++;
    if (cuisines.isNotEmpty) count++;
    return count;
  }

  static const List<double> ratingOptions = [3.5, 4.0, 4.5];
  static const List<double> radiusOptions = [1, 3, 5];
}