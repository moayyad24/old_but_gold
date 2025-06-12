import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

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
          Text(t.auth.skip, style: AppTextStyles.bold16),
        ],
      ),
    );
  }
}
