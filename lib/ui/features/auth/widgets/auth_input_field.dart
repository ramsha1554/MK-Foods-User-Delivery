import 'package:flutter/material.dart';

import '../../../core/theme/app_text_styles.dart';

class AuthInputField extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final Color? fillColor;
  final Color? borderColor;
  final TextAlign textAlign;
  final TextStyle? style;
  final FocusNode? focusNode;

  const AuthInputField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.maxLength,
    this.fillColor,
    this.borderColor,
    this.textAlign = TextAlign.start,
    this.style,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: fillColor ?? const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(16),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        focusNode: focusNode,
        keyboardType: keyboardType,
        maxLength: maxLength,
        onChanged: onChanged,
        style: AppTextStyles.cardTitle.copyWith(color: Color(0xFF3C3C3C)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
          counterText: '',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: prefixIcon,
          ),
          prefixIconConstraints:
              const BoxConstraints(minWidth: 44, minHeight: 44),
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(12),
                  child: suffixIcon,
                )
              : null,
          suffixIconConstraints:
              const BoxConstraints(minWidth: 44, minHeight: 44),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}
