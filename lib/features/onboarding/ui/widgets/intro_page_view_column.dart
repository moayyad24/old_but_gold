import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';

class IntroPageViewColumn extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const IntroPageViewColumn({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, height: 282.h, width: 403.w),
        47.verticalSpace,
        Padding(
          padding: UiParameters.hPadding,
          child: Column(
            children: [
              Text(title, style: AppTextStyles.bold28),
              26.verticalSpace,
              Text(subTitle, style: AppTextStyles.medium20),
            ],
          ),
        ),
      ],
    );
  }
}
