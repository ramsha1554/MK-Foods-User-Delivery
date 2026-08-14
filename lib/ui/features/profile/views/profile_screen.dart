import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:intl/intl.dart';

import '../../../../core/di/locator.dart';
import '../../../../data/models/auth_models.dart';
import '../../../../data/models/customer_models.dart';
import '../../../../data/repositories/customer_repository.dart';
import '../../../core/theme/app_avatar_sizes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_dialogs.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../address/views/address_list_screen.dart';
import '../../auth/providers/auth_provider.dart';
import '../../orders/views/orders_screen.dart';
import '../providers/profile_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _isEditing = false;
  bool _isSaving = false;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _startEditing(User user) {
    _nameController.text = user.name ?? '';
    _emailController.text = user.email ?? '';
    setState(() => _isEditing = true);
  }

  Future<void> _save() async {
    if (_nameController.text.trim().isEmpty) {
      AppSnackbar.show(context, 'Name cannot be empty.', type: AppSnackbarType.error);
      return;
    }

    setState(() => _isSaving = true);
    try {
      final updated = await locator<CustomerRepository>().updateProfile(
        UpdateProfileRequest(
          name: _nameController.text.trim(),
          email: _emailController.text.trim().isEmpty ? null : _emailController.text.trim(),
        ),
      );
      await ref.read(authProvider.notifier).refreshAfterProfileUpdate(updated);
      ref.invalidate(profileProvider);
      if (mounted) {
        setState(() => _isEditing = false);
        AppSnackbar.show(context, 'Profile updated.', type: AppSnackbarType.success);
      }
    } catch (e) {
      if (mounted) {
        AppSnackbar.show(
          context,
          e.toString().replaceAll('Exception: ', ''),
          type: AppSnackbarType.error,
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  Future<void> _confirmLogout() async {
    final confirmed = await showAppConfirmDialog(
      context,
      title: 'Log out?',
      message: 'You\'ll need to verify your phone number again to sign back in.',
      confirmLabel: 'Log Out',
      isDestructive: true,
    );

    if (confirmed != true || !mounted) return;

    await ref.read(authProvider.notifier).logout();
  }
  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(profileProvider);
    final fallbackUser = ref.watch(authProvider).user;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          profileAsync.maybeWhen(
            data: (user) => _isEditing
                ? const SizedBox.shrink()
                : IconButton(
                    icon: const Icon(LucideIcons.pencil, size: 20),
                    onPressed: () => _startEditing(user),
                  ),
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),
      body: profileAsync.when(
        loading: () => fallbackUser == null
            ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
            : _buildContent(fallbackUser),
        error: (err, _) => fallbackUser != null
            ? _buildContent(fallbackUser)
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.xxl),
                  child: Text(
                    err.toString().replaceAll('Exception: ', ''),
                    style: AppTextStyles.bodySecondary,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
        data: (user) => _buildContent(user),
      ),
    );
  }

  Widget _buildContent(User user) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        // ── Avatar + name/phone ──
        Center(
          child: Column(
            children: [
              Container(
                width: 76,
                height: 76,
                decoration: const BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Text(
                  (user.name?.isNotEmpty ?? false) ? user.name![0].toUpperCase() : '?',
                  style: const TextStyle(fontSize: AppAvatarSizes.initialMedium, fontWeight: FontWeight.w800, color: AppColors.primary),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              if (!_isEditing) ...[
                Text(user.name ?? 'Add your name', style: AppTextStyles.h2),
                const SizedBox(height: 2),
                Text(user.phone, style: AppTextStyles.bodySecondary),
              ],
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.xl),

        if (_isEditing) ...[
          TextField(
            controller: _nameController,
            style: AppTextStyles.body,
            decoration: const InputDecoration(labelText: 'Name', prefixIcon: Icon(LucideIcons.user, size: 20)),
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: _emailController,
            style: AppTextStyles.body,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Email (optional)', prefixIcon: Icon(LucideIcons.mail, size: 20)),
          ),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(LucideIcons.phone, size: 15, color: AppColors.textSecondary),
                const SizedBox(width: AppSpacing.sm),
                Text(user.phone, style: AppTextStyles.bodySecondary),
                const Spacer(),
                Text('Not editable', style: AppTextStyles.caption),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _isSaving ? null : () => setState(() => _isEditing = false),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: ElevatedButton(
                  onPressed: _isSaving ? null : _save,
                  child: _isSaving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Save'),
                ),
              ),
            ],
          ),
        ] else ...[
          if (user.email != null && user.email!.isNotEmpty)
            _InfoRow(icon: LucideIcons.mail, label: user.email!),
          if (user.createdAt != null)
            _InfoRow(icon: LucideIcons.calendar, label: 'Member since ${DateFormat.yMMMM().format(user.createdAt!)}'),
          const SizedBox(height: AppSpacing.xl),

          _MenuTile(
            icon: LucideIcons.mapPin,
            label: 'Saved Addresses',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddressListScreen())),
          ),
          _MenuTile(
            icon: LucideIcons.receipt,
            label: 'My Orders',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OrdersScreen())),
          ),
          const SizedBox(height: AppSpacing.xl),
          _MenuTile(
            icon: LucideIcons.logOut,
            label: 'Log Out',
            iconColor: AppColors.error,
            labelColor: AppColors.error,
            onTap: _confirmLogout,
          ),
        ],
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.textSecondary),
          const SizedBox(width: AppSpacing.sm),
          Text(label, style: AppTextStyles.bodySecondary),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? labelColor;

  const _MenuTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: iconColor ?? AppColors.textSecondary),
            const SizedBox(width: AppSpacing.md),
            Text(label, style: AppTextStyles.body.copyWith(color: labelColor, fontWeight: FontWeight.w600)),
            const Spacer(),
            const Icon(LucideIcons.chevronRight, size: 18, color: AppColors.textHint),
          ],
        ),
      ),
    );
  }
}