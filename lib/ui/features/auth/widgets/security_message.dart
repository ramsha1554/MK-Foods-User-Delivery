import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

/// Static reassurance row — lock icon in a soft circular badge plus two
/// lines of copy. No state, no functionality.
class SecurityMessage extends StatelessWidget {
  const SecurityMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
            color: AppColors.primaryLight,
            shape: BoxShape.circle,
          ),
          child: const Icon(LucideIcons.lock, size: 16, color: AppColors.primary),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Your information is secure with us.',
                style: AppTextStyles.caption,
              ),
              Text(
                'We never share your details with anyone.',
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),
      ],
    );
  }
}