import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class StepDot extends StatelessWidget {
  final double size;
  final Color color;

  const StepDot({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color, // Background
        shape: BoxShape.circle,
      ),
      child: Container(
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.darkBlue02314C, width: 2),
        ),
        child: Center(
          child: Container(
            width: size / 2 - 3,
            height: size / 2 - 3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkBlue02314C,
            ),
          ),
        ),
      ),
    );
  }
}

class CompletedDot extends StatelessWidget {
  const CompletedDot({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 21.w,
      height: 21.h,
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.whiteFFFDF2, // Background
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.check_circle, size: 22, color: AppColors.green006A6F),
    );
  }
}
