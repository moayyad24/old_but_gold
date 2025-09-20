import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class CategorySelector extends StatelessWidget {
  final String? category;
  final String? subCategory;
  final void Function()? onTap;

  const CategorySelector({
    super.key,
    required this.onTap,
    this.category,
    this.subCategory,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(child: _buildContainer('Category', 'Electronics', category)),
          SizedBox(width: 10.w),
          (subCategory == '')
              ? const SizedBox.shrink()
              : Expanded(
                  child: _buildContainer('Sub-Category', 'Phones', subCategory),
                ),
        ],
      ),
    );
  }

  Widget _buildContainer(String title, String hint, String? text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.medium14),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.whiteFFFFFF,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.greyC2C2C2, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 10.0, end: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text ?? hint,
                  style: AppTextStyles.medium14.copyWith(
                    color: text == null
                        ? AppColors.grey666666
                        : AppColors.black,
                  ),
                ),
                Icon(Icons.unfold_more, size: 24, color: AppColors.black),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
