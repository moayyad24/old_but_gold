import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class HomeContentArea extends StatelessWidget {
  final Widget child;
  const HomeContentArea({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteFFFDF2,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
        border: Border.all(color: AppColors.greyC2C2C2),
      ),
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.only(top: 70),
      child: child,
    );
  }
}