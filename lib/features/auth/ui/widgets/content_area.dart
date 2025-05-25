import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class ContentArea extends StatelessWidget {
  final bool addPadding;
  final Widget child;
  const ContentArea({super.key, this.addPadding = true, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteFFFDF2,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
            border: Border.all(color: AppColors.darkGrey666666.withAlpha(100)),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkGrey666666.withAlpha(100),
                blurRadius: 10, // Adjust blur
                spreadRadius: 0, // Adjust spread
                offset: Offset(0, -1), // This controls direction (x, y)
              ),
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: Ink(
            decoration: BoxDecoration(color: AppColors.whiteFFFDF2),
            padding:
                addPadding
                    ? EdgeInsets.only(top: 10, left: 10, right: 10)
                    : EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    );
  }
}
