import 'package:flutter/material.dart';
import 'app_durations.dart';

class SlideUpPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  SlideUpPageRoute({required this.page})
      : super(
          transitionDuration: AppDurations.emphasis,
          reverseTransitionDuration: AppDurations.standard,
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final slide = Tween(begin: const Offset(0, 0.06), end: Offset.zero)
                .animate(CurvedAnimation(parent: animation, curve: AppCurves.panel));
            final fade = CurvedAnimation(parent: animation, curve: AppCurves.enter);
            return FadeTransition(
              opacity: fade,
              child: SlideTransition(position: slide, child: child),
            );
          },
        );
}

class SlideRightPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  SlideRightPageRoute({required this.page})
      : super(
          transitionDuration: AppDurations.emphasis,
          reverseTransitionDuration: AppDurations.standard,
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final slide = Tween(begin: const Offset(0.08, 0), end: Offset.zero)
                .animate(CurvedAnimation(parent: animation, curve: AppCurves.panel));
            final fade = CurvedAnimation(parent: animation, curve: AppCurves.enter);
            return FadeTransition(
              opacity: fade,
              child: SlideTransition(position: slide, child: child),
            );
          },
        );
}
