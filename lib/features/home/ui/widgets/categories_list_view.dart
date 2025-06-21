import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 74.h,
                width: 74.w,
                margin: EdgeInsets.symmetric(horizontal: 6),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.mainFFE09C,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.grey666666.withAlpha(50)),
                ),
                child: SvgPicture.asset(
                  'assets/icons/onboarding/onboarding_$index.svg',
                ),
              ),
              Text('Gaming', style: AppTextStyles.semiBold15),
            ],
          );
        },
      ),
    );
  }
}
