import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';

class IntroAppBar extends StatelessWidget {
  const IntroAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiParameters.dPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('OBG App', style: AppTextStyles.bold28),
          Text('Skip', style: AppTextStyles.bold16),
        ],
      ),
    );
  }
}
