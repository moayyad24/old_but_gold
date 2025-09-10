import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class AppContentArea extends StatelessWidget {
  final Widget child;
  final double? topPadding;
  const AppContentArea({super.key, required this.child, this.topPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteFFFDF2,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
        border: Border.all(color: AppColors.greyC2C2C2),
      ),
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.only(top: topPadding ?? 70),
      child: child,
    );
  }
}
