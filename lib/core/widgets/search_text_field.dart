import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required TextEditingController searchController,
    required this.hintText,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.greyF8F8F8,
        hintText: hintText,
        isDense: true,
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.only(start: 16.w, end: 10),
          child: SvgPicture.asset('assets/icons/search_icon.svg'),
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 40).w,
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 17.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: AppColors.greyC2C2C2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: AppColors.greyC2C2C2, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: AppColors.blue2E8DFA, width: 1.5),
        ),
      ),
    );
  }
}
