import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/filter_options.dart';

class FilterNotifier extends StateNotifier<FilterOptions> {
  FilterNotifier() : super(const FilterOptions());

  void apply(FilterOptions options) => state = options;

  void reset() => state = const FilterOptions();
}

final filterProvider = StateNotifierProvider<FilterNotifier, FilterOptions>(
  (ref) => FilterNotifier(),
);