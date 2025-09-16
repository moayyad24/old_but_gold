import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';
import 'package:old_but_gold/core/widgets/app_bar_button.dart';
import 'package:old_but_gold/core/widgets/custom_stepper.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class AuthAppBar extends StatelessWidget {
  final List<DotState>? dots;
  const AuthAppBar({super.key, this.dots});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiParameters.dPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBarButton(),
          dots != null ? CustomStepper(dots: dots!) : SizedBox.shrink(),
          Text(
            t.auth.skip,
            style: AppTextStyles.bold16.copyWith(
              decoration: TextDecoration.underline,
              decorationThickness: 1.5,
              decorationColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
