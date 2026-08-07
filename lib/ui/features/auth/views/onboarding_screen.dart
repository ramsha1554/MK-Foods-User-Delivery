import 'package:flutter/material.dart';
import '../../../../core/animations/app_fade_in.dart';
import '../../../../core/animations/app_durations.dart';
import '../../../../core/animations/app_page_transitions.dart';
import '../../../../core/animations/app_slide_in.dart';
import '../../../../core/constants/app_config.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_3d_button.dart';
import 'phone_login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              AppSlideIn(
                direction: SlideDirection.left,
                duration: AppDurations.emphasis,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Text(
                    AppConfig.appNameShort,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 1),
              AppFadeIn(
                duration: AppDurations.hero,
                delay: AppDurations.micro,
                child: Container(
                  height: 260,
                  width: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withValues(alpha: 0.15),
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/MK-Tour-Logo-Tagline.png',
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              AppSlideIn(
                direction: SlideDirection.up,
                delay: AppDurations.micro,
                child: Column(
                  children: [
                    Text(
                      'Good Food',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      'Healthy Food',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Delicious meals delivered to your door',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              AppSlideIn(
                direction: SlideDirection.up,
                delay: const Duration(milliseconds: 250),
                child: Column(
                  children: [
                    App3dButton(
                      text: 'Get Started',
                      onPressed: () {
                        Navigator.of(context).push(
                          SlideRightPageRoute(page: const PhoneLoginScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          SlideRightPageRoute(page: const PhoneLoginScreen()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                          text: "Don't have an Account? ",
                          children: [
                            TextSpan(
                              text: 'Sign up',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
