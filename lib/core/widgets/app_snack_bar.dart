import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class AppSnackBar {
  static void showSuccess(BuildContext context, {required String message}) {
    _show(
      context,
      message: message,
      backgroundColor: AppColors.green006A6F,
      icon: Icons.check_circle_rounded,
      iconColor: AppColors.whiteFFFFFF,
      title: 'success',
    );
  }

  static void showError(BuildContext context, {required String message}) {
    _show(
      context,
      message: message,
      backgroundColor: Colors.red.shade600,
      icon: Icons.error_rounded,
      iconColor: AppColors.whiteFFFFFF,
      title: 'failed',
    );
  }

  static void showInfo(BuildContext context, {required String message}) {
    _show(
      context,
      message: message,
      backgroundColor: AppColors.blue7FB3B5,
      icon: Icons.info_rounded,
      iconColor: AppColors.whiteFFFFFF,
      title: 'information',
    );
  }

  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required IconData icon,
    required Color iconColor,
    required String title,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: backgroundColor,
      margin: EdgeInsets.only(top: 32.h, left: 16.w, right: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 18.h),
      borderRadius: BorderRadius.circular(18.r),
      icon: Icon(icon, color: iconColor, size: 22.sp),
      messageText: Text(
        message,
        maxLines: 2,
        style: AppTextStyles.medium14.copyWith(color: AppColors.whiteFBFBFB),
        overflow: TextOverflow.ellipsis,
      ),
      duration: Duration(seconds: 3),
      shouldIconPulse: false,
      animationDuration: Duration(milliseconds: 400),
      forwardAnimationCurve: Curves.easeOutCubic,
      reverseAnimationCurve: Curves.easeInCubic,
      isDismissible: true,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      mainButton:
          (actionLabel != null && onAction != null)
              ? TextButton(
                onPressed: () {
                  onAction();
                },
                child: Text(
                  actionLabel,
                  style: AppTextStyles.medium14.copyWith(
                    color: AppColors.whiteFBFBFB,
                  ),
                ),
              )
              : null,
    ).show(context);
  }
}
