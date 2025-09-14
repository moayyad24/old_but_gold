import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class AppBackButton extends StatelessWidget {
  final IconData? icon;
  const AppBackButton({super.key, this.icon = Icons.arrow_back_rounded});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38.w,
      height: 38.w,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainFFEECA,
          elevation: 3,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: AppColors.black.withAlpha(50)),
          ),
        ),
        child: Icon(icon, size: 24, color: AppColors.black),
      ),
    );
  }
}
