/// 4pt-based spacing scale. Use these everywhere instead of raw numbers,
/// so spacing is visually consistent across every screen.
class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
}

/// Shared corner-radius scale. Matches the existing cardTheme (16) and
/// inputDecorationTheme (12) values already in app_theme.dart — this just
/// makes them reusable instead of re-typed in every widget.
class AppRadius {
  AppRadius._();

  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double pill = 999;
}