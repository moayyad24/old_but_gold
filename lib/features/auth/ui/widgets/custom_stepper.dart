import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/features/auth/ui/widgets/steps_dots.dart';

enum DotState { completed, current, next }

class CustomStepper extends StatelessWidget {
  final List<DotState> dots;

  const CustomStepper({super.key, required this.dots});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dots.length,
        separatorBuilder:
            (context, index) => SizedBox(
              width: 40,
              child: Divider(
                thickness: 3,
                height: 27,
                color: AppColors.darkGrey666666,
              ),
            ),
        itemBuilder: (context, index) {
          switch (dots[index]) {
            case DotState.completed:
              return CompletedDot();
            case DotState.current:
              return StepDot(size: 26, color: AppColors.mainFFE09C);
            case DotState.next:
              return StepDot(size: 21, color: AppColors.greyC2C2C2);
          }
        },
      ),
    );
  }
}
