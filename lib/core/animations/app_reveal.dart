import 'package:flutter/material.dart';
import 'app_durations.dart';

class AppReveal extends StatelessWidget {
  final bool isRevealed;
  final Widget content;
  final Widget placeholder;

  const AppReveal({
    super.key,
    required this.isRevealed,
    required this.content,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AppDurations.standard,
      switchInCurve: AppCurves.enter,
      switchOutCurve: AppCurves.exit,
      child: isRevealed
          ? KeyedSubtree(key: const ValueKey('content'), child: content)
          : KeyedSubtree(key: const ValueKey('placeholder'), child: placeholder),
    );
  }
}
