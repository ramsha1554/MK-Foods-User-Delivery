---
name: app_animations
description: Skill for implementing consistent, subtle, and cohesive micro-animations across the MK Foods Flutter app — fade, slide, reveal, scale, and page transition patterns that create a smooth, polished feel without drawing attention to themselves.
---

# ✨ MK Foods - Animation System Skill

This skill defines the **single animation language** for the entire app. Animations here are not decorative flourishes — they are functional cues that guide the user's eye, confirm interactions, and make the app feel alive. The golden rule:

> **Animation should be felt, not watched.** If the user notices the animation, it is probably too long, too fast, or too dramatic.

---

## ⏱️ 1. Duration & Easing Tokens

All durations and curves are defined once as constants in `lib/core/animations/app_durations.dart`. **Never hardcode millisecond values** anywhere else in the codebase.

```dart
// lib/core/animations/app_durations.dart

abstract final class AppDurations {
  /// 100ms — instant feedback: button press states, checkbox toggles, ripples
  static const Duration instant   = Duration(milliseconds: 100);

  /// 200ms — micro transitions: icon swaps, badge count changes, opacity flickers
  static const Duration micro     = Duration(milliseconds: 200);

  /// 300ms — standard transitions: card reveals, list item entrances, tab switches
  static const Duration standard  = Duration(milliseconds: 300);

  /// 450ms — emphasis transitions: bottom sheet slide up, page push/pop
  static const Duration emphasis  = Duration(milliseconds: 450);

  /// 600ms — onboarding / hero reveals: first load splash, large image fade-in
  static const Duration hero      = Duration(milliseconds: 600);
}

abstract final class AppCurves {
  /// Ease out — for elements entering the screen (they decelerate into position)
  static const Curve enter   = Curves.easeOutCubic;

  /// Ease in — for elements leaving the screen (they accelerate away)
  static const Curve exit    = Curves.easeInCubic;

  /// Ease in-out — for elements that stay on screen but change state
  static const Curve inOut   = Curves.easeInOutCubic;

  /// Spring — for tactile, bouncy feedback on press and toggle interactions
  static const Curve spring  = Curves.elasticOut;

  /// Decelerate — for large-panel slides (bottom sheets, drawers)
  static const Curve panel   = Curves.decelerate;
}
```

---

## 🎞️ 2. Core Animation Widgets

Place these at `lib/core/animations/`. They are drop-in wrappers — wrap any widget with them, never animate manually inside feature screens.

### 2a. `AppFadeIn` — Opacity entrance
Use for: cards loading from API, avatars, images, notification items, any content that "appears".

```dart
// lib/core/animations/app_fade_in.dart

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
```

### 2b. `AppSlideIn` — Directional slide + fade entrance
Use for: bottom sheets, list items entering from the side, screen content on navigation.

```dart
// lib/core/animations/app_slide_in.dart

import 'package:flutter/material.dart';
import 'app_durations.dart';

enum SlideDirection { up, down, left, right }

class AppSlideIn extends StatefulWidget {
  final Widget child;
  final SlideDirection direction;
  final Duration duration;
  final Duration delay;
  final double offset; // fractional — 0.0 to 1.0 (1.0 = full widget size)

  const AppSlideIn({
    super.key,
    required this.child,
    this.direction = SlideDirection.up,
    this.duration = AppDurations.standard,
    this.delay = Duration.zero,
    this.offset = 0.18,  // subtle — 18% of widget height/width
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
      SlideDirection.up    => Offset(0, o),
      SlideDirection.down  => Offset(0, -o),
      SlideDirection.left  => Offset(o, 0),
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
```

### 2c. `AppScaleTap` — Press feedback
Use for: every tappable surface — cards, buttons, icon buttons, category chips. Gives a physical "press down" feel.

```dart
// lib/core/animations/app_scale_tap.dart

import 'package:flutter/material.dart';
import 'app_durations.dart';

class AppScaleTap extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double scale; // 0.96 is the sweet spot for cards; 0.94 for buttons

  const AppScaleTap({
    super.key,
    required this.child,
    this.onTap,
    this.scale = 0.96,
  });

  @override
  State<AppScaleTap> createState() => _AppScaleTapState();
}

class _AppScaleTapState extends State<AppScaleTap>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: AppDurations.instant,
      reverseDuration: AppDurations.micro,
    );
    _scale = Tween(begin: 1.0, end: widget.scale)
        .animate(CurvedAnimation(parent: _ctrl, curve: AppCurves.inOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _ctrl.forward(),
      onTapUp: (_) {
        _ctrl.reverse();
        widget.onTap?.call();
      },
      onTapCancel: () => _ctrl.reverse(),
      child: ScaleTransition(scale: _scale, child: widget.child),
    );
  }
}
```

### 2d. `AppStaggeredList` — Staggered list item entrance
Use for: any `ListView` or `GridView` that loads items from an API. Items cascade in with a small delay between each.

```dart
// lib/core/animations/app_staggered_list.dart

import 'package:flutter/material.dart';
import 'app_slide_in.dart';
import 'app_durations.dart';

/// Wraps a list item with a staggered slide+fade entrance.
/// Pass [index] to compute the delay automatically.
class AppStaggeredItem extends StatelessWidget {
  final int index;
  final Widget child;

  /// Max stagger delay cap — items beyond this index all use the max delay.
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
```

### 2e. `AppReveal` — Content reveal (skeleton → content)
Use for: replacing loading skeletons with real content. Fades out the skeleton and fades in the content.

```dart
// lib/core/animations/app_reveal.dart

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
```

---

## 🗺️ 3. Page Transition System

All route pushes must use these transitions. Never use the default `MaterialPageRoute` platform transition — it is inconsistent across iOS/Android.

Define a custom page builder and register it in your router.

```dart
// lib/core/animations/app_page_transitions.dart

import 'package:flutter/material.dart';
import 'app_durations.dart';

/// Standard page push: new page slides up from bottom + fades in.
/// Use for: drilling into detail screens (item details, order tracking).
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

/// Lateral page push: new page slides in from the right.
/// Use for: auth flows (login → signup), onboarding steps.
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
```

---

## 🧩 4. Component-Level Animation Contracts

These rules define **which animation applies to which UI component**. Every developer building a screen must follow these:

| Component | Animation | Duration | Widget |
|-----------|-----------|----------|--------|
| Screen initial load | Fade in | `hero` | `AppFadeIn` on the body Scaffold |
| List / Grid items | Staggered slide up + fade | `standard` + index delay | `AppStaggeredItem` |
| Food category chips | Slide in from left | `standard` | `AppSlideIn(direction: left)` |
| Cards (product, cart) | Fade in | `standard` | `AppFadeIn` |
| Skeleton → content | Cross-fade | `standard` | `AppReveal` |
| Button press | Scale down to 0.94 | `instant` | `AppScaleTap(scale: 0.94)` |
| Card press | Scale down to 0.96 | `instant` | `AppScaleTap(scale: 0.96)` |
| Bottom sheet entrance | Slide up + fade | `emphasis` | `SlideUpPageRoute` / modal sheet |
| Auth screen push | Slide right + fade | `emphasis` | `SlideRightPageRoute` |
| Drill-down push | Slide up + fade | `emphasis` | `SlideUpPageRoute` |
| Tab switch | Fade cross-dissolve | `micro` | `AnimatedSwitcher` |
| Checkbox toggle | Scale + color | `instant` | `AnimatedContainer` (in `PlayfulCheckbox`) |
| Badge / counter | Animated digit flip | `micro` | `AnimatedSwitcher` with `ScaleTransition` |
| Notification dot | Pulse scale loop | `standard` | `AnimatedBuilder` with repeat |
| Error state | Shake horizontal | `standard` | `TweenSequence` on X offset |

---

## 🚫 5. What Not to Do

| ❌ Avoid | ✅ Do instead |
|----------|--------------|
| Bounce/elastic on navigation | Reserve `AppCurves.spring` only for small toggle/checkbox feedback |
| Duration over 600ms on any standard interaction | Cap at `AppDurations.hero` (600ms) for large reveals only |
| Raw `opacity` setState flickers | Use `AnimatedOpacity` or `AppFadeIn` |
| `Transform.scale` without animation controller | Use `AppScaleTap` |
| Running animations in a `build` method directly | Always use `StatefulWidget` + `AnimationController` or a wrapper widget |
| Animating colour using setState on every frame | Use `AnimatedContainer` or `TweenAnimationBuilder` |
| Multiple competing animations on the same widget | One widget, one animation responsibility |

---

## 🔍 6. Verification Checklist

- [ ] `lib/core/animations/app_durations.dart` exists with all 5 duration + 5 curve tokens.
- [ ] All tap interactions use `AppScaleTap` — zero raw `GestureDetector` with no press feedback.
- [ ] All list/grid screens wrap items in `AppStaggeredItem(index: i)`.
- [ ] Loading → data transitions use `AppReveal` (or `AnimatedSwitcher`) — no abrupt pops.
- [ ] All route pushes use `SlideUpPageRoute` or `SlideRightPageRoute` — zero plain `MaterialPageRoute`.
- [ ] No animation `Duration` is hardcoded inline — all reference `AppDurations.*`.
- [ ] No animation `Curve` is hardcoded inline — all reference `AppCurves.*`.
- [ ] No animation runs longer than `600ms` on any standard user-triggered interaction.
