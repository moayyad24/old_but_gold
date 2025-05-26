import 'package:flutter/widgets.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 90,
      decoration: BoxDecoration(
        color: AppColors.greyB7B7B7,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
