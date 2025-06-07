import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class OtpTimer extends StatefulWidget {
  final VoidCallback onResend;
  final int countdownDuration; // in seconds

  const OtpTimer({
    super.key,
    required this.onResend,
    this.countdownDuration = 60,
  });

  @override
  State<OtpTimer> createState() => _OtpTimerWidgetState();
}

class _OtpTimerWidgetState extends State<OtpTimer> {
  late int _remainingTime;
  late Timer _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.countdownDuration;
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _canResend = false;
    _remainingTime = widget.countdownDuration;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  void _handleResend() {
    if (_canResend) {
      widget.onResend();
      _startTimer(); // Restart the timer
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Didn't receive code? ",
          style: TextStyle(fontSize: 14.sp, color: AppColors.grey666666),
        ),
        GestureDetector(
          onTap: _handleResend,
          child: Text(
            _canResend ? "Resend" : "Resend in $_remainingTime seconds",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: _canResend ? AppColors.blue2E8DFA : AppColors.grey666666,
            ),
          ),
        ),
      ],
    );
  }
}
