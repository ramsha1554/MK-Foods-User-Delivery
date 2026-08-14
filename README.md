# mk_foods_user_driver

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Font sizes

Never write `TextStyle(fontSize: N)` directly in a screen or widget. Always use
`AppTextStyles.x` or `AppTextStyles.x.copyWith(...)` for non-size properties. If
no existing style fits, that's a signal to add a new named style to
`AppTextStyles` — not a one-off number. The only exceptions are
`lib/ui/core/theme/app_avatar_sizes.dart` (decorative avatar-initial letters)
and the two documented glyph literals (flag emoji, social-login icon).

Manual check before committing:

```bash
grep -rn "fontSize:" lib/ | grep -v app_text_styles.dart | grep -v app_avatar_sizes.dart
```

Any result from this (besides the two known glyph literals) means a `fontSize`
slipped in outside the scale.
