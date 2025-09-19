import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:old_but_gold/core/constants/db_keys.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class ProfilePictureAndName extends StatelessWidget {
  const ProfilePictureAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 100.w,
          height: 102.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23).r,
            border: Border.all(width: 4, color: AppColors.green1D4A64),
            image: DecorationImage(
              image: AssetImage('assets/images/test_image.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getIt<LocalStorageService>()
                  .getBool(DbKeys.hasProfileInfo)
                  .toString(),
              style: AppTextStyles.bold22,
            ),
            Row(
              children: [
                SvgPicture.asset('assets/icons/mingcute_star.svg'),
                Text(' 4.5', style: AppTextStyles.semiBold17),
                Text(' • 30 Ratings', style: AppTextStyles.semiBold17),
              ],
            ),
          ],
        ),
        SvgPicture.asset('assets/icons/solar_medal.svg'),
      ],
    );
  }
}
