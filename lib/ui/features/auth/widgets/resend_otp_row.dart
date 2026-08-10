import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/theme/app_colors.dart';

/// Clock icon + "Didn't receive the code?" + a live countdown that becomes
/// a tappable "Resend" once it reaches zero.
///
/// Owns its own [Timer] so the parent screen doesn't need any resend-timer
/// state of its own — it only needs to react to [onResend] when the user
/// actually taps resend after the countdown finishes.
class ResendOtpRow extends StatefulWidget {
  final VoidCallback onResend;
  final int secondsDuration;

  const ResendOtpRow({
    super.key,
    required this.onResend,
    this.secondsDuration = 45,
  });

  @override
  State<ResendOtpRow> createState() => _ResendOtpRowState();
}

class _ResendOtpRowState extends State<ResendOtpRow> {
  late int _secondsLeft;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _secondsLeft = widget.secondsDuration;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_secondsLeft <= 1) {
        timer.cancel();
        setState(() => _secondsLeft = 0);
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  void _handleResendTap() {
    if (_secondsLeft > 0) return;
    widget.onResend();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formatted {
    final minutes = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsLeft % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final canResend = _secondsLeft == 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          LucideIcons.history,
          size: 16,
          color: canResend ? AppColors.primary : AppColors.textSecondary,
        ),
        const SizedBox(width: 6),
        Text(
          "Didn't receive the code? ",
          style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
        ),
        GestureDetector(
          onTap: canResend ? _handleResendTap : null,
          child: Text(
            canResend ? 'Resend' : 'Resend in $_formatted',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}