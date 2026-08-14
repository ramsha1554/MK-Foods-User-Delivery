import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/animations/app_fade_in.dart';
import '../../../../core/animations/app_page_transitions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_3d_button.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../home/views/home_screen.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_input_field.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() =>
      _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      AppSnackbar.show(context, 'Please enter your name', type: AppSnackbarType.error);
      return;
    }
    ref.read(authProvider.notifier).updateName(name);
    Navigator.of(context).pushAndRemoveUntil(
      SlideUpPageRoute(page: const HomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: AppFadeIn(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Text(
                  'Complete Profile',
                  style: AppTextStyles.display.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tell us your name to get started',
                  style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 48),
                AuthInputField(
                  hintText: 'Enter your name',
                  prefixIcon: Icon(
                    LucideIcons.user,
                    size: 20,
                    color: AppColors.textHint,
                  ),
                  controller: _nameController,
                ),
                const SizedBox(height: 32),
                App3dButton(
                  text: 'Save',
                  onPressed: _saveProfile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
