import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isFavorite;
  const ImageCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.itemPreviewScreen);
      },
      child: Container(
        width: 164,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          border: BoxBorder.all(color: AppColors.greyB7B7B7, width: 2),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildFavIcon(isFavorite),
            Spacer(),
            _buildPrice(),
            8.verticalSpace,
            _buildTitleOverlay(),
          ],
        ),
      ),
    );
  }

  Align _buildFavIcon(bool isFavorite) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 10, end: 7),
        child: InkWell(
          onTap: () {},
          child: isFavorite
              ? SvgPicture.asset('assets/icons/liked_black.svg')
              : SvgPicture.asset('assets/icons/liked_white.svg'),
        ),
      ),
    );
  }

  Align _buildPrice() {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        height: 32,
        width: 83,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10).r,
        decoration: BoxDecoration(
          color: Color(0xFFB0E1E3),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(9.r),
            bottomStart: Radius.circular(9.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '125.5',
              style: AppTextStyles.bold16.copyWith(color: Color(0xFF006A6F)),
            ),
            5.horizontalSpace,
            SvgPicture.asset('assets/icons/dollar.svg', width: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleOverlay() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 50.h,
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(13.r),
            bottomRight: Radius.circular(13.r),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 6.0, // Horizontal blur strength
              sigmaY: 6.0, // Vertical blur strength
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(13.r),
                  bottomRight: Radius.circular(13.r),
                ),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x80D8D9DB),
                    Color(0x80ADACAC),
                    Color(0xFFCCCCCD),
                  ],
                  stops: [0.0, 0.2, 0.96],
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                title,
                style: AppTextStyles.bold16.copyWith(
                  color: AppColors.black,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
