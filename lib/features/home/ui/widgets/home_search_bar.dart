import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      width: 345.w,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 14,
              top: 10,
              bottom: 10,
              end: 5,
            ),
            child: SvgPicture.asset('assets/icons/search_icon.svg'),
          ),
          isDense: true,
          hintText: 'Search for anything...',
          hintStyle: TextStyle(
            color: AppColors.darkGrey666666,
            fontSize: 16.sp,
          ),
          fillColor: AppColors.whiteFFFFFF,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.greyC2C2C2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: AppColors.greyC2C2C2,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: AppColors.blue2E8DFA,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
