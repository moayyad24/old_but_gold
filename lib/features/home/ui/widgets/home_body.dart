import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteFFFDF2,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
        border: Border.all(color: AppColors.greyC2C2C2),
      ),
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.only(left: 24, right: 24).r,
      child: SizedBox(width: double.infinity, height: 1000),
    );
  }
}
