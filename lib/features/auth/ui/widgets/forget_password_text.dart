import 'package:flutter/widgets.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class ForgotPasswordText extends StatelessWidget {
  final VoidCallback onTap;

  const ForgotPasswordText({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'Forgotten password?',
        style: TextStyle(
          fontSize: 13,
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
