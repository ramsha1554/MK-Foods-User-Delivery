import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

/// Displays the fixed UK country code for the phone field.
///
/// This app currently only serves the UK, so the selector is intentionally
/// static (+44) rather than pulling in a full country-picker package.
/// The chevron is present to visually match the target design but is a
/// placeholder — wire [onTap] to a real picker later only if multi-country
/// support is actually needed.
class CountryCodeSelector extends StatelessWidget {
  final VoidCallback? onTap;

  const CountryCodeSelector({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
            Text('🇬🇧', style: TextStyle(fontSize: 18)),
            SizedBox(width: 6),
            Text(
              '+44',
              style: AppTextStyles.cardTitle.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 4),
            Icon(LucideIcons.chevronDown, size: 16, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}