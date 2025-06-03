import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';
import 'package:old_but_gold/core/widgets/app_back_button.dart';
import 'package:old_but_gold/features/auth/ui/widgets/custom_stepper.dart';
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
          AppBackButton(),
          dots != null ? CustomStepper(dots: dots!) : SizedBox.shrink(),
          Text(
            t.auth.skip,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              decorationThickness: 1.2,
              decorationColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
