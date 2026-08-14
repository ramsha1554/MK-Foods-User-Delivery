

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/animations/app_fade_in.dart';
import '../../../../core/animations/app_page_transitions.dart';
import '../../../../core/animations/app_scale_tap.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_3d_button.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_input_field.dart';
import '../widgets/country_code_selector.dart';
import '../widgets/login_hero.dart';
import 'otp_verification_screen.dart';

class PhoneLoginScreen extends ConsumerStatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  ConsumerState<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends ConsumerState<PhoneLoginScreen> {
  final _phoneController = TextEditingController();
  final _phoneFocusNode = FocusNode();

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  void _requestOtp() {
    final raw = _phoneController.text.trim();
    if (raw.isEmpty) {
      AppSnackbar.show(context, 'Please enter your phone number', type: AppSnackbarType.error);
      return;
    }

   
    final digits = raw.replaceAll(RegExp(r'[^0-9]'), '');
    final national = digits.startsWith('0') ? digits.substring(1) : digits;
    final phone = '+44$national';

    ref.read(authProvider.notifier).requestOtp(phone);
  }

  void _showComingSoon(String feature) {
    AppSnackbar.show(context, '$feature — coming soon', type: AppSnackbarType.info);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    ref.listen<AuthState>(authProvider, (prev, next) {
      if (next.status == AuthStatus.error && next.errorMessage != null) {
        AppSnackbar.show(context, next.errorMessage!, type: AppSnackbarType.error);
        ref.read(authProvider.notifier).clearError();
      }
      if (next.status == AuthStatus.unauthenticated && next.phone != null) {
        Navigator.of(context).push(
          SlideRightPageRoute(page: const OtpVerificationScreen()),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      body: SingleChildScrollView(
        child: AppFadeIn(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SafeArea(bottom: false, child: LoginHero()),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Welcome back!',
                        style: AppTextStyles.h1.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter your mobile number to continue',
                        style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CountryCodeSelector(),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AuthInputField(
                            hintText: 'Enter mobile number',
                            prefixIcon: Icon(
                              LucideIcons.phone,
                              size: 20,
                              color: AppColors.textHint,
                            ),
                            controller: _phoneController,
                            focusNode: _phoneFocusNode,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    App3dButton(
                      text: authState.status == AuthStatus.loading
                          ? 'Sending...'
                          : 'Continue',
                      onPressed:
                          authState.status == AuthStatus.loading ? null : _requestOtp,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const Expanded(child: Divider(color: AppColors.divider)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'or continue with',
                            style: AppTextStyles.caption,
                          ),
                        ),
                        const Expanded(child: Divider(color: AppColors.divider)),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: AppScaleTap(
                            scale: 0.96,
                            child: _socialButton(
                              label: 'Continue with Google',
                              icon: 'G',
                              onTap: () => _showComingSoon('Google sign-in'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AppScaleTap(
                            scale: 0.96,
                            child: _socialButton(
                              label: 'Continue with Apple',
                              icon: 'A',
                              onTap: () => _showComingSoon('Apple sign-in'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    GestureDetector(
                      onTap: () => _phoneFocusNode.requestFocus(),
                      child: RichText(
                        text: TextSpan(
                          style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                          text: 'New to MK Tours? ',
                          children: [
                            TextSpan(
                              text: 'Create an account',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          'By continuing, you agree to our ',
                          style: AppTextStyles.caption.copyWith(color: AppColors.textHint),
                        ),
                        GestureDetector(
                          onTap: () => _showComingSoon('Terms & Conditions'),
                          child: Text(
                            'Terms & Conditions',
                            style: AppTextStyles.caption.copyWith(decoration: TextDecoration.underline),
                          ),
                        ),
                        Text(
                          ' and ',
                          style: AppTextStyles.caption.copyWith(color: AppColors.textHint),
                        ),
                        GestureDetector(
                          onTap: () => _showComingSoon('Privacy Policy'),
                          child: Text(
                            'Privacy Policy',
                            style: AppTextStyles.caption.copyWith(decoration: TextDecoration.underline),
                          ),
                        ),
                        Text(
                          '.',
                          style: AppTextStyles.caption.copyWith(color: AppColors.textHint),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButton({
    required String label,
    required String icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              icon,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}