import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';
import 'package:old_but_gold/core/widgets/app_bar_button.dart';
import 'package:old_but_gold/core/widgets/custom_stepper.dart';

class CreatePostAppBar extends StatelessWidget {
  final List<DotState>? dots;
  const CreatePostAppBar({super.key, this.dots});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiParameters.dPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBarButton(),
          dots != null ? CustomStepper(dots: dots!) : SizedBox.shrink(),
          SizedBox(width: 30),
        ],
      ),
    );
  }
}
