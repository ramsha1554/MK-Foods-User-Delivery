import 'package:flutter/material.dart';
import '../../../core/animations/app_durations.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// Subtle ambient pulse applied to skeleton placeholder shapes.
///
/// Wraps a composition of [SkeletonBox] / [SkeletonCircle] / [SkeletonText]
/// shapes so the whole loading surface gently breathes instead of sitting
/// static. One controller per composition keeps the overhead negligible.
class SkeletonPulse extends StatefulWidget {
  final Widget child;

  const SkeletonPulse({super.key, required this.child});

  @override
  State<SkeletonPulse> createState() => _SkeletonPulseState();
}

class _SkeletonPulseState extends State<SkeletonPulse>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: AppDurations.hero,
      reverseDuration: AppDurations.hero,
    )..repeat(reverse: true);
    _opacity = Tween<double>(begin: 1.0, end: 0.45)
        .animate(CurvedAnimation(parent: _ctrl, curve: AppCurves.inOut));
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

/// A rounded-rectangle block used as the base skeleton shape.
class SkeletonBox extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color color;

  const SkeletonBox({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.radius = AppRadius.sm,
    this.color = AppColors.cardBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

/// Circular skeleton shape for avatars, status dots and icons.
class SkeletonCircle extends StatelessWidget {
  final double size;
  final Color color;

  const SkeletonCircle({
    super.key,
    required this.size,
    this.color = AppColors.cardBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

/// A bar shaped like a line of text.
class SkeletonText extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const SkeletonText({
    super.key,
    required this.width,
    this.height = 12,
    this.radius = AppRadius.sm,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonBox(width: width, height: height, radius: radius);
  }
}

/// Card-shaped container matching the app's surface + border card style.
class SkeletonCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;

  const SkeletonCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.radius = AppRadius.lg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: child,
    );
  }
}