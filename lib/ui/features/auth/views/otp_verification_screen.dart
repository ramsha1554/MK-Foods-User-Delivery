
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/animations/app_fade_in.dart';
import '../../../../core/animations/app_page_transitions.dart';
import '../../../../core/animations/app_scale_tap.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_3d_button.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../home/views/home_screen.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_input_field.dart';
import '../widgets/resend_otp_row.dart';
import '../widgets/security_message.dart';
import 'profile_setup_screen.dart';

class OtpVerificationScreen extends ConsumerStatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  ConsumerState<OtpVerificationScreen> createState() =>
      _OtpVerificationScreenState();
}

class _OtpVerificationScreenState
    extends ConsumerState<OtpVerificationScreen> {
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _verifyOtp() {
    final code = _codeController.text.trim();
    if (code.length != 6) {
      AppSnackbar.show(context, 'Please enter the 6-digit code', type: AppSnackbarType.error);
      return;
    }
    ref.read(authProvider.notifier).verifyOtp(code).then((isNewUser) {
      if (!mounted) return;
      if (isNewUser) {
        Navigator.of(context).pushReplacement(
          SlideRightPageRoute(page: const ProfileSetupScreen()),
        );
      } else {
        Navigator.of(context).pushAndRemoveUntil(
          SlideUpPageRoute(page: const HomeScreen()),
          (route) => false,
        );
      }
    });
  }

  void _changeNumber() {
    // Same navigation the back button already performs — OTP screen was
    // pushed (not pushReplacement) from the login screen, so popping
    // returns there with authState.phone still available to edit.
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    ref.listen<AuthState>(authProvider, (prev, next) {
      if (next.status == AuthStatus.error && next.errorMessage != null) {
        AppSnackbar.show(context, next.errorMessage!, type: AppSnackbarType.error);
        ref.read(authProvider.notifier).clearError();
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: AppFadeIn(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppScaleTap(
                    scale: 0.94,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.cardBorder),
                        ),
                        child: const Icon(
                          LucideIcons.arrowLeft,
                          size: 20,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Verify your number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "We've sent a 6-digit code to",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        authState.phone ?? 'your phone',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: _changeNumber,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Change',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                          Icon(LucideIcons.chevronRight, size: 16, color: AppColors.primary),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Text(
                  'Enter the 6-digit code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 12),
                AuthInputField(
                  hintText: '000000',
                  prefixIcon: Icon(
                    LucideIcons.lock,
                    size: 20,
                    color: AppColors.textHint,
                  ),
                  controller: _codeController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  fillColor: Colors.white,
                  borderColor: AppColors.cardBorder,
                ),
                const SizedBox(height: 24),
                App3dButton(
                  text: authState.status == AuthStatus.loading
                      ? 'Verifying...'
                      : 'Verify OTP',
                  onPressed: authState.status == AuthStatus.loading
                      ? null
                      : _verifyOtp,
                ),
                const SizedBox(height: 20),
                ResendOtpRow(
                  onResend: () {
                    if (authState.phone != null) {
                      ref.read(authProvider.notifier).requestOtp(authState.phone!);
                    }
                  },
                ),
                const SizedBox(height: 72),
                const SecurityMessage(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
