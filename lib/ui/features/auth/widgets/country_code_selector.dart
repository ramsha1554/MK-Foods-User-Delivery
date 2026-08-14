import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/data/countries.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'country_picker_sheet.dart';

/// Displays the currently selected country code for the phone field.
///
/// Tapping opens a searchable picker ([showCountryPicker]) with the full
/// countries list; picking one updates the flag + dial code shown here and
/// reports the new country through [onChanged].
class CountryCodeSelector extends StatefulWidget {
  final Country initialCountry;
  final ValueChanged<Country>? onChanged;

  const CountryCodeSelector({
    super.key,
    this.initialCountry = unitedKingdom,
    this.onChanged,
  });

  @override
  State<CountryCodeSelector> createState() => _CountryCodeSelectorState();
}

class _CountryCodeSelectorState extends State<CountryCodeSelector> {
  late Country _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialCountry;
  }

  Future<void> _openPicker() async {
    final picked = await showCountryPicker(context, initial: _selected);
    if (picked != null) {
      setState(() => _selected = picked);
      widget.onChanged?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openPicker,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_selected.flag, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 6),
            Text(
              _selected.dialCode,
              style: AppTextStyles.cardTitle.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 4),
            Icon(LucideIcons.chevronDown, size: 16, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}