import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class GetStartedButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GetStartedButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainFFE09C, // Background color
        foregroundColor: AppColors.black, // Text/icon color
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(10),
            bottomStart: Radius.circular(10),
          ),
        ),
        elevation: 0,
        minimumSize: Size(210.w, 48.h),
        maximumSize: Size(210.w, 48.h),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Get Started', style: AppTextStyles.bold20),
          SizedBox(width: 18.w),
          Icon(Icons.arrow_forward, size: 24),
        ],
      ),
    );
  }
}
