import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String location;
  final double price;
  final VoidCallback? onFavoriteTap;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.location,
    required this.price,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.h,
      decoration: BoxDecoration(
        color: Color(0xFFFFFCF6),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(6, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(20.r),
              bottomStart: Radius.circular(20.r),
            ),
            child: Image.asset(imageUrl, width: 120.w, fit: BoxFit.cover),
          ),

          // Details
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(9.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Favorite icon
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: AppTextStyles.bold18,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: onFavoriteTap,
                        child: SvgPicture.asset(
                          'assets/icons/liked.svg',
                          width: 22,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 4.h),

                  // Description
                  Text(
                    description,
                    style: AppTextStyles.medium12,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Location + Price
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/map_pin.svg', width: 22),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(location, style: AppTextStyles.semiBold13),
                      ),
                      Container(
                        height: 32.h,
                        width: 82.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.teal[100],
                          borderRadius: BorderRadius.circular(9.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              price.toStringAsFixed(2),
                              style: AppTextStyles.bold16.copyWith(
                                color: AppColors.green006A6F,
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/icons/dollar.svg',
                              width: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
