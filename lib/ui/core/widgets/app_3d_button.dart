import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class App3dButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? shadowColor;

  const App3dButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    final btnColor = color ?? AppColors.primary;
    final shadow = shadowColor ?? AppColors.primaryDark;

    return GestureDetector(
      onTap: onPressed,
      behavior: onPressed == null ? HitTestBehavior.opaque : null,
      child: Stack(
        children: [
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: shadow,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -4),
            child: Container(
              height: 56,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: btnColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                text,
                style: AppTextStyles.cardTitle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
