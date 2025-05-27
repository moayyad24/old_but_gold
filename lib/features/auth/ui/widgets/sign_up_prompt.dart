import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

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
          style: TextStyle(
            fontSize: 15.sp,
            color: AppColors.darkGrey666666,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 6.w),
        GestureDetector(
          onTap: onSignUpPressed,
          child: Text(
            secondWord,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.blue0D87F9,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
