import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';
import 'package:old_but_gold/core/widgets/content_area.dart';
import 'package:old_but_gold/features/auth/ui/widgets/otp_field.dart';
import 'package:old_but_gold/features/auth/ui/widgets/otp_timer.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppBar(),
          ContentArea(
            child: Column(
              children: [
                DragHandle(),
                SizedBox(height: 20.h),
                Text(t.auth.verifyCode, style: AppTextStyles.bold26),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  child: Text(
                    t.auth.fourDigitCode,
                    style: AppTextStyles.medium15,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 32.h),
                OtpField(
                  onCompleted: (value) {
                    //
                  },
                ),
                SizedBox(height: 10.h),
                OtpTimer(
                  onResend: () {},
                  countdownDuration: 30, // Optional: customize countdown
                ),
                SizedBox(height: 32.h),
                Text(
                  t.auth.haveNotReceivedTheCode,
                  style: AppTextStyles.semiBold13.copyWith(
                    color: AppColors.blue2E8DFA,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 34.h),
                Text(
                  t.auth.weMayUseYourEmailAddress,
                  style: AppTextStyles.medium14.copyWith(
                    color: AppColors.grey666666,
                  ),
                ),
                SizedBox(height: 36.h),
                AppConfirmButton(
                  text: t.auth.verify,
                  onPressed: () {
                    //
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
