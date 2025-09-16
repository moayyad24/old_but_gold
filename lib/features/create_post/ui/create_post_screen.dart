import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/app_text_field.dart';
import 'package:old_but_gold/core/widgets/content_area.dart';
import 'package:old_but_gold/core/widgets/custom_choice_chip.dart';
import 'package:old_but_gold/core/widgets/custom_stepper.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/create_post/ui/widgets/create_post_app_bar.dart';
import 'package:old_but_gold/features/create_post/ui/widgets/post_bottom_navbar.dart';
import 'package:old_but_gold/features/create_post/ui/widgets/upload_image_box.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PostBottomNavBar(
        iconLabel: 'Preview',
        onPressed: () {
          Navigator.pushNamed(context, Routes.previewPostScreen);
        },
      ),
      body: Column(
        children: [
          CreatePostAppBar(dots: [DotState.current, DotState.next]),
          Expanded(
            child: ContentArea(
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    DragHandle(),
                    20.verticalSpace,
                    Text('Create a Post', style: AppTextStyles.bold26),
                    36.verticalSpace,
                    AppTextField(
                      fieldTitle: 'Item Name',
                      hintText: 'Enter the name of the item',
                      prefixIconPath: 'assets/icons/promo_code.svg',
                      myController: TextEditingController(),
                      checkValid: (v) {
                        return '';
                      },
                    ),
                    23.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.categoryScreen);
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildContainer('Category', 'Electronics'),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: _buildContainer('Sub-Category', 'Phones'),
                          ),
                        ],
                      ),
                    ),
                    23.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price', style: AppTextStyles.medium14),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Expanded(child: _buildPriceTextField('\$\$\$\$')),
                            SizedBox(width: 10.w),
                            Expanded(child: _buildDropdown('Fixe')),
                          ],
                        ),
                      ],
                    ),
                    23.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Product State', style: AppTextStyles.medium14),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            CustomChoiceChip(
                              label: "Brand New",
                              icon: Icons.location_on,
                              selected: true,
                              onSelected: (val) {},
                            ),
                            10.horizontalSpace,
                            CustomChoiceChip(
                              label: "Used",
                              icon: Icons.fiber_new,
                              selected: false,
                              onSelected: (val) {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    23.verticalSpace,
                    AppTextField(
                      fieldTitle: 'Description',
                      hintText:
                          'Pre-owned iPhone 15 in excellent condition—enjoy its sleek design, powerful performance, and advanced camera at a great value...',
                      myController: TextEditingController(),
                      maxLines: 4,
                      checkValid: (v) {
                        return '';
                      },
                    ),
                    23.verticalSpace,
                    UploadImageBox(),
                    23.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(String title, String hint) {
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
                  hint,
                  style: AppTextStyles.medium14.copyWith(
                    color: AppColors.grey666666,
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

  Widget _buildPriceTextField(String hintText) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.medium14.copyWith(color: AppColors.grey666666),
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10),
        suffixIcon: const Icon(
          Icons.unfold_more,
          size: 24,
          color: AppColors.black,
        ),
        filled: true,
        fillColor: AppColors.whiteFFFFFF,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.greyC2C2C2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.greyC2C2C2, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.blue2E8DFA, width: 1.5),
        ),
      ),
    );
  }

  Widget _buildDropdown(String hintText) {
    return DropdownButtonFormField<String>(
      icon: Icon(Icons.unfold_more),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10),
        filled: true,
        fillColor: AppColors.whiteFFFFFF,
        hintText: hintText,
        hintStyle: AppTextStyles.medium14.copyWith(color: AppColors.grey666666),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.greyC2C2C2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.greyC2C2C2, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.blue2E8DFA, width: 1.5),
        ),
      ),
      items: const [
        DropdownMenuItem(value: '1', child: Text('Fixe')),
        DropdownMenuItem(value: '2', child: Text('Negotiable')),
      ],
      style: AppTextStyles.medium14,
      onChanged: (value) {
        debugPrint("Selected: $value");
      },
    );
  }
}
