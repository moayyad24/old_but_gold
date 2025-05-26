import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class SignUpPrompt extends StatelessWidget {
  final VoidCallback onSignUpPressed;

  const SignUpPrompt({super.key, required this.onSignUpPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          t.auth.do_not_have_an_account,
          style: TextStyle(
            fontSize: 15,
            color: AppColors.darkGrey666666,
            decoration: TextDecoration.underline,
          ),
        ),
        GestureDetector(
          onTap: onSignUpPressed,
          child: Text(
            t.auth.sign_up,
            style: TextStyle(
              fontSize: 16,
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
