import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class AppConfirmButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool border;
  final Color? backgroundColor;
  const AppConfirmButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.border = false,
    this.isLoading = false,
    this.backgroundColor = AppColors.mainFFE09C,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side:
                border
                    ? BorderSide(color: AppColors.greyC2C2C2)
                    : BorderSide.none,
          ),

          elevation: 0.2,
          shadowColor: AppColors.greyC2C2C2,
        ),
        child:
            isLoading
                ? const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                )
                : Text(text, style: AppTextStyles.bold20),
      ),
    );
  }
}
