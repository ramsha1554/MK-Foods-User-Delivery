import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';


class LoginHero extends StatelessWidget {
  const LoginHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
      decoration: const BoxDecoration(color: AppColors.primaryLight),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Great food,',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                    height: 1.15,
                  ),
                ),
                const Text(
                  'delivered to',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                    height: 1.15,
                  ),
                ),
                const Text(
                  'your door',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Delicious meals from your favourite restaurants, delivered fast.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Image.asset(
              'assets/images/MK-Tour-Logo.png',
              width: 96,
              height: 96,
              errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}