import 'package:flutter/material.dart';
import 'app_slide_in.dart';
import 'app_durations.dart';

class AppStaggeredItem extends StatelessWidget {
  final int index;
  final Widget child;

  static const int _maxStagger = 6;

  const AppStaggeredItem({super.key, required this.index, required this.child});

  @override
  Widget build(BuildContext context) {
    final clampedIndex = index.clamp(0, _maxStagger);
    final delay = Duration(milliseconds: clampedIndex * 60);
    return AppSlideIn(
      direction: SlideDirection.up,
      delay: delay,
      duration: AppDurations.standard,
      child: child,
    );
  }
}
