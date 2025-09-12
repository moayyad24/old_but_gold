import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class AppContentArea extends StatelessWidget {
  final Widget child;
  final double? topPadding;
  final bool? boxShadow;
  const AppContentArea({
    super.key,
    required this.child,
    this.topPadding,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteFFFDF2,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
        border: Border(
          top: BorderSide(color: AppColors.greyC2C2C2),
          left: BorderSide(color: AppColors.greyC2C2C2),
          right: BorderSide(color: AppColors.greyC2C2C2),
        ),
        boxShadow: [
          if (boxShadow == true)
            const BoxShadow(
              blurRadius: 10,
              offset: Offset(0, -3),
              color: AppColors.greyB7B7B7,
            ),
        ],
      ),
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.only(top: topPadding ?? 70),
      child: child,
    );
  }
}
