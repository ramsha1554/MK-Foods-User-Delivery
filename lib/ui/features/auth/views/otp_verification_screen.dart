import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/animations/app_fade_in.dart';
import '../../../../core/animations/app_page_transitions.dart';
import '../../../../core/animations/app_scale_tap.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_3d_button.dart';
import '../../home/views/home_screen.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_input_field.dart';
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the 6-digit code')),
      );
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

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    ref.listen<AuthState>(authProvider, (prev, next) {
      if (next.status == AuthStatus.error && next.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage!)),
        );
        ref.read(authProvider.notifier).clearError();
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: AppFadeIn(
            child: Column(
              children: [
                const SizedBox(height: 60),
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
                  'Enter Code',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'We sent a 6-digit code to ${authState.phone ?? "your phone"}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 48),
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
                ),
                const SizedBox(height: 24),
                App3dButton(
                  text: authState.status == AuthStatus.loading
                      ? 'Verifying...'
                      : 'Verify',
                  onPressed: authState.status == AuthStatus.loading
                      ? null
                      : _verifyOtp,
                ),
                const SizedBox(height: 16),
                AppScaleTap(
                  scale: 0.96,
                  child: GestureDetector(
                    onTap: () {
                      if (authState.phone != null) {
                        ref.read(authProvider.notifier).requestOtp(authState.phone!);
                      }
                    },
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
