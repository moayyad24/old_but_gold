import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class SignUpPrompt extends StatelessWidget {
  final VoidCallback onSignUpPressed;
  final String firstWord;
  final String secondWord;

  const SignUpPrompt({
    super.key,
    required this.onSignUpPressed,
    required this.firstWord,
    required this.secondWord,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstWord,
          style: AppTextStyles.medium15.copyWith(
            color: AppColors.darkGrey666666,
          ),
        ),
        SizedBox(width: 6.w),
        GestureDetector(
          onTap: onSignUpPressed,
          child: Text(
            secondWord,
            style: AppTextStyles.bold16.copyWith(
              color: AppColors.blue0D87F9,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
