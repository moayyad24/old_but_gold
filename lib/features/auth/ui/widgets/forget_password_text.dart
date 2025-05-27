import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class ForgotPasswordText extends StatelessWidget {
  final VoidCallback onTap;

  const ForgotPasswordText({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        t.auth.forget_password,
        style: TextStyle(
          fontSize: 13.sp,
          color: AppColors.black,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.black,
          decorationThickness: 1.2,
          decorationStyle: TextDecorationStyle.solid,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
