import 'package:flutter/material.dart';
import 'app_durations.dart';

class AppFadeIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;

  const AppFadeIn({
    super.key,
    required this.child,
    this.duration = AppDurations.standard,
    this.delay = Duration.zero,
  });

  @override
  State<AppFadeIn> createState() => _AppFadeInState();
}

class _AppFadeInState extends State<AppFadeIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.duration);
    _opacity = CurvedAnimation(parent: _ctrl, curve: AppCurves.enter);

    Future.delayed(widget.delay, () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      FadeTransition(opacity: _opacity, child: widget.child);
}
