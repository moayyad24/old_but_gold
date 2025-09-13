import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class ContentArea extends StatelessWidget {
  final Widget child;
  final bool applyPadding;
  const ContentArea({super.key, required this.child, this.applyPadding = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.sp),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.whiteFFFDF2,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
          border: Border.all(color: AppColors.darkGrey666666.withAlpha(100)),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkGrey666666.withAlpha(100),
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(0, -1),
            ),
          ],
        ),
        padding: applyPadding
            ? EdgeInsets.only(top: 10, left: 24, right: 24).r
            : null,
        child: SingleChildScrollView(child: child),
      ),
    );
  }
}
