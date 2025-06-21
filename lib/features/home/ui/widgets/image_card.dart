import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double width;
  final double height;

  const ImageCard({
    super.key,
    required this.imagePath,
    required this.title,
    this.width = 164,
    this.height = 221,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: AppColors.greyC2C2C2,
            offset: const Offset(-3, -2),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildFavIcon(),
          Spacer(),
          _buildPrice(),
          8.verticalSpace,
          _buildTitleOverlay(),
        ],
      ),
    );
  }

  Align _buildFavIcon() {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: IconButton(onPressed: () {}, icon: Icon(Icons.favorite_rounded)),
    );
  }

  Align _buildPrice() {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        height: 32,
        width: 83,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFB0E1E3),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(9.r),
            bottomStart: Radius.circular(9.r),
          ),
        ),
        child: Text(
          '125.5 \$',
          style: AppTextStyles.bold16.copyWith(color: Color(0xFF006A6F)),
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(14.r),
            bottomRight: Radius.circular(14.r),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFD8D9DB), Color(0xFFADACAC), Color(0xFF414141)],
            stops: [0.0, 0.2, 0.96],
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.bold16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
