import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class ProfileButton extends StatelessWidget {
  final String title;
  final String iconPath;
  final Color? backgroundColor;
  final Color? borderColor;
  final void Function()? onPressed;
  const ProfileButton({
    super.key,
    required this.title,
    required this.iconPath,
    this.backgroundColor,
    this.borderColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.greyC2C2C2.withAlpha(150),
            blurRadius: 8,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(color: borderColor ?? Color(0xFFFFDC91), width: 2),
          elevation: 0,
          iconSize: 24,
          minimumSize: Size(150, 48),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath),
            13.horizontalSpace,
            Text(title, style: AppTextStyles.bold18),
          ],
        ),
      ),
    );
  }
}
