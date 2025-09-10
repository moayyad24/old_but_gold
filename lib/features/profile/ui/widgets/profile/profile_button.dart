import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class ProfileButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? backgroundColor;
  final Color? borderColor;
  const ProfileButton({
    super.key,
    required this.title,
    required this.icon,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
          Icon(icon),
          13.horizontalSpace,
          Text(title, style: AppTextStyles.bold18),
        ],
      ),
    );
  }
}
