import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiParameters.hPadding,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              style: AppTextStyles.medium15,
              text:
                  "Pre-owned iPhone 15 in excellent condition—enjoy its sleek design, powerful performance, and advanced camera at a great value...",
            ),
            TextSpan(
              text: "Read more",
              style: AppTextStyles.semiBold17.copyWith(
                color: AppColors.blue0D87F9,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle click action
                  debugPrint("Read more clicked");
                },
            ),
          ],
        ),
      ),
    );
  }
}
