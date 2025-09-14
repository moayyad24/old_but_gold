import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';

class UserPictureNameCard extends StatelessWidget {
  const UserPictureNameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiParameters.hPadding.copyWith(bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.buyersProfileScreen);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 70.w,
              height: 70.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 4, color: AppColors.green1D4A64),
                image: DecorationImage(
                  image: AssetImage('assets/images/test_image.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            16.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Azeddine Miche', style: AppTextStyles.bold22),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/mingcute_star.svg'),
                    Text(' 4.5', style: AppTextStyles.semiBold17),
                    Text(' • 30 Ratings', style: AppTextStyles.semiBold17),
                  ],
                ),
              ],
            ),
            Spacer(),
            SvgPicture.asset('assets/icons/solar_medal.svg'),
          ],
        ),
      ),
    );
  }
}
