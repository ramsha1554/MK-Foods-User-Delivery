import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../core/theme/app_colors.dart';

/// Home Screen's own bottomNavigationBar (not an app-wide tab shell —
/// that doesn't exist yet). Home/Orders/Profile route to existing screens;
/// Search/Favourites have no screens built yet, so they surface a
/// "coming soon" snackbar instead of a broken navigation.
class HomeBottomNav extends StatelessWidget {
  final VoidCallback onOrdersTap;
  final VoidCallback onProfileTap;
  final VoidCallback onUnavailableTap;

  const HomeBottomNav({
    super.key,
    required this.onOrdersTap,
    required this.onProfileTap,
    required this.onUnavailableTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {
        switch (index) {
          case 0:
            break; // already on Home
          case 1:
          case 3:
            onUnavailableTap();
            break;
          case 2:
            onOrdersTap();
            break;
          case 4:
            onProfileTap();
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(LucideIcons.house), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(LucideIcons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(LucideIcons.receipt), label: 'Orders'),
        BottomNavigationBarItem(icon: Icon(LucideIcons.heart), label: 'Favourites'),
        BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: 'Profile'),
      ],
    );
  }
}