import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_bottom_sheet.dart';
import '../models/filter_options.dart';

Future<FilterOptions?> showFilterBottomSheet(
  BuildContext context, {
  required FilterOptions current,
  required List<String> availableCuisines,
}) {
  return showModalBottomSheet<FilterOptions>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _FilterSheet(initial: current, availableCuisines: availableCuisines),
  );
}

class _FilterSheet extends StatefulWidget {
  final FilterOptions initial;
  final List<String> availableCuisines;

  const _FilterSheet({required this.initial, required this.availableCuisines});

  @override
  State<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<_FilterSheet> {

  late FilterOptions _draft;

  @override
  void initState() {
    super.initState();
    _draft = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.4,
      maxChildSize: 0.92,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.sm),
              const AppSheetHandle(),
              Padding(
                padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Sort & Filter', style: AppTextStyles.h2),
                    TextButton(
                      onPressed: () => setState(() => _draft = const FilterOptions()),
                      child: const Text('Reset'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                  children: [
                    _SectionTitle('SORT BY'),
                    ...SortOption.values.map(
                      (opt) => RadioListTile<SortOption>(
                        value: opt,
                        groupValue: _draft.sortBy,
                        onChanged: (v) => setState(() => _draft = _draft.copyWith(sortBy: v)),
                        title: Text(opt.label, style: AppTextStyles.body),
                        activeColor: AppColors.primary,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    _SectionTitle('MINIMUM RATING'),
                    Wrap(
                      spacing: AppSpacing.sm,
                      children: FilterOptions.ratingOptions.map((r) {
                        final selected = _draft.minRating == r;
                        return ChoiceChip(
                          label: Text('$r ★'),
                          selected: selected,
                          selectedColor: AppColors.primaryLight,
                          onSelected: (_) => setState(
                            () => _draft = selected
                                ? _draft.copyWith(clearMinRating: true)
                                : _draft.copyWith(minRating: r),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    _SectionTitle('DELIVERY RADIUS'),
                    Wrap(
                      spacing: AppSpacing.sm,
                      children: FilterOptions.radiusOptions.map((r) {
                        final selected = _draft.radiusKm == r;
                        return ChoiceChip(
                          label: Text('${r.toInt()} km'),
                          selected: selected,
                          selectedColor: AppColors.primaryLight,
                          onSelected: (_) => setState(() => _draft = _draft.copyWith(radiusKm: r)),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    if (widget.availableCuisines.isNotEmpty) ...[
                      _SectionTitle('CUISINES'),
                      Wrap(
                        spacing: AppSpacing.sm,
                        runSpacing: AppSpacing.xs,
                        children: widget.availableCuisines.map((c) {
                          final selected = _draft.cuisines.contains(c);
                          return FilterChip(
                            label: Text(c),
                            selected: selected,
                            selectedColor: AppColors.primaryLight,
                            onSelected: (_) => setState(() {
                              final next = Set<String>.from(_draft.cuisines);
                              selected ? next.remove(c) : next.add(c);
                              _draft = _draft.copyWith(cuisines: next);
                            }),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: AppSpacing.md),
                    ],

                    SwitchListTile(
                      value: _draft.openNowOnly,
                      onChanged: (v) => setState(() => _draft = _draft.copyWith(openNowOnly: v)),
                      title: const Text('Open Now', style: AppTextStyles.body),
                      activeThumbColor: AppColors.primary,
                      contentPadding: EdgeInsets.zero,
                    ),
                    SwitchListTile(
                      value: _draft.freeDeliveryOnly,
                      onChanged: (v) => setState(() => _draft = _draft.copyWith(freeDeliveryOnly: v)),
                      title: const Text('Free Delivery', style: AppTextStyles.body),
                      activeThumbColor: AppColors.primary,
                      contentPadding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: AppSpacing.xxl),
                  ],
                ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context, _draft),
                      child: const Text('Apply'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Text(text, style: AppTextStyles.eyebrow),
    );
  }
}