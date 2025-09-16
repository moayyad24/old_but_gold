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
      height: 110.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return CategoryCard(
            title: 'Gaming',
            iconPath: 'assets/icons/onboarding/onboarding_$index.svg',
            isActive: index == 0 ? true : false,
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isActive;
  const CategoryCard({
    super.key,
    required this.title,
    required this.iconPath,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 75.h,
          width: 75.w,
          margin: EdgeInsets.symmetric(horizontal: 6),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isActive ? AppColors.mainFFE09C : Color(0xFFFFE8B2),
            borderRadius: BorderRadius.circular(12),
            border: isActive
                ? Border.all(
                    color: AppColors.grey666666.withAlpha(50),
                    width: 2,
                  )
                : null,
          ),
          child: SvgPicture.asset(iconPath),
        ),
        10.verticalSpace,
        Text(title, style: AppTextStyles.semiBold15),
      ],
    );
  }
}
