import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class GoogleAuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const GoogleAuthButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.whiteFFFFFF,
          foregroundColor: AppColors.black,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(color: AppColors.greyC2C2C2, width: 1.0),
          elevation: 0,
        ),
        child:
            isLoading
                ? const CircularProgressIndicator(
                  color: Colors.blue, // Google blue color
                  strokeWidth: 2,
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/google.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      t.auth.continue_with_google,
                      style: AppTextStyles.semiBold17,
                    ),
                  ],
                ),
      ),
    );
  }
}
