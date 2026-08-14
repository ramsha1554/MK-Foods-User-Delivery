import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/data/countries.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_bottom_sheet.dart';
import 'auth_input_field.dart';

/// Opens a searchable bottom-sheet picker and returns the chosen country,
/// or `null` if the sheet was dismissed without a selection.
Future<Country?> showCountryPicker(
  BuildContext context, {
  Country? initial,
}) {
  return showModalBottomSheet<Country>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _CountryPickerSheet(initial: initial),
  );
}

class _CountryPickerSheet extends StatefulWidget {
  final Country? initial;

  const _CountryPickerSheet({this.initial});

  @override
  State<_CountryPickerSheet> createState() => _CountryPickerSheetState();
}

class _CountryPickerSheetState extends State<_CountryPickerSheet> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Country> get _filtered {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return countries;
    return countries.where((c) => c.name.toLowerCase().contains(q)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;

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
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.md,
                  AppSpacing.lg,
                  0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Select Country', style: AppTextStyles.h2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.md,
                  AppSpacing.lg,
                  AppSpacing.sm,
                ),
                child: AuthInputField(
                  hintText: 'Search country',
                  prefixIcon: const Icon(
                    LucideIcons.search,
                    size: 20,
                    color: AppColors.textHint,
                  ),
                  controller: _searchController,
                  onChanged: (v) => setState(() => _query = v),
                ),
              ),
              Expanded(
                child: filtered.isEmpty
                    ? const Center(
                        child: Text(
                          'No countries found',
                          style: AppTextStyles.bodySecondary,
                        ),
                      )
                    : ListView.builder(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.lg,
                          vertical: AppSpacing.sm,
                        ),
                        itemCount: filtered.length,
                        itemBuilder: (_, index) {
                          final country = filtered[index];
                          return _CountryRow(
                            country: country,
                            selected: country.name == widget.initial?.name,
                            onTap: () => Navigator.pop(context, country),
                          );
                        },
                      ),
              ),
              const SizedBox(height: AppSpacing.sm),
            ],
          ),
        );
      },
    );
  }
}

class _CountryRow extends StatelessWidget {
  final Country country;
  final bool selected;
  final VoidCallback onTap;

  const _CountryRow({
    required this.country,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryLight : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: Row(
          children: [
            Text(country.flag, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                country.name,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.body.copyWith(
                  color: selected ? AppColors.primary : AppColors.textPrimary,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Text(
              country.dialCode,
              style: AppTextStyles.cardTitle.copyWith(
                color: selected ? AppColors.primary : AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}