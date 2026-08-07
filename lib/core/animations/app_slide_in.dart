import 'package:flutter/material.dart';
import 'app_durations.dart';

enum SlideDirection { up, down, left, right }

class AppSlideIn extends StatefulWidget {
  final Widget child;
  final SlideDirection direction;
  final Duration duration;
  final Duration delay;
  final double offset;

  const AppSlideIn({
    super.key,
    required this.child,
    this.direction = SlideDirection.up,
    this.duration = AppDurations.standard,
    this.delay = Duration.zero,
    this.offset = 0.18,
  });

  @override
  State<AppSlideIn> createState() => _AppSlideInState();
}

class _AppSlideInState extends State<AppSlideIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;

  Offset get _begin {
    final o = widget.offset;
    return switch (widget.direction) {
      SlideDirection.up => Offset(0, o),
      SlideDirection.down => Offset(0, -o),
      SlideDirection.left => Offset(o, 0),
      SlideDirection.right => Offset(-o, 0),
    };
  }

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.duration);
    _slide = Tween(begin: _begin, end: Offset.zero)
        .animate(CurvedAnimation(parent: _ctrl, curve: AppCurves.enter));
    _fade = CurvedAnimation(parent: _ctrl, curve: AppCurves.enter);

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
  Widget build(BuildContext context) => FadeTransition(
        opacity: _fade,
        child: SlideTransition(position: _slide, child: widget.child),
      );
}
