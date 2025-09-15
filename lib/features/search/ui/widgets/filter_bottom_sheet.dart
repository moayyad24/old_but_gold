import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/custom_choice_chip.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';

class FilterBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      backgroundColor: AppColors.whiteFFFDF2,
      builder: (context) {
        return SizedBox(
          height: 450.h,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 16.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: DragHandle()),
                    20.verticalSpace,
                    Center(child: Text("Filters", style: AppTextStyles.bold26)),
                    20.verticalSpace,
                    // Location Dropdown
                    Text("Location", style: AppTextStyles.medium14),
                    8.verticalSpace,
                    _buildDropdown(
                      hintText: 'My City',
                      items: ["My city", "Nearby", "Custom"]
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                    ),
                    16.verticalSpace,
                    // Date Dropdown
                    Text("Date", style: AppTextStyles.medium14),
                    8.verticalSpace,
                    _buildDropdown(
                      hintText: 'Today',
                      items: ["Today", "Last Week", "Last Month"]
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                    ),
                    16.verticalSpace,

                    // Condition Buttons
                    Text("Condition", style: AppTextStyles.medium14),
                    8.verticalSpace,
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
                    24.verticalSpace,
                  ],
                ),
              ),
              // Buttons
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 24, top: 12),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFF6DC),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainFFE09C,
                          foregroundColor: AppColors.black,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(10),
                              bottomStart: Radius.circular(10),
                            ),
                          ),
                          elevation: 0,
                          minimumSize: Size(188.w, 48.h),
                        ),
                        iconAlignment: IconAlignment.end,
                        icon: Icon(Icons.arrow_forward, size: 24),
                        label: Text('Filter   ', style: AppTextStyles.bold20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static DropdownButtonFormField<String> _buildDropdown({
    required String hintText,
    items,
  }) {
    return DropdownButtonFormField<String>(
      icon: Icon(Icons.unfold_more),
      style: AppTextStyles.medium16.copyWith(color: AppColors.grey666666),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10),
        filled: true,
        fillColor: AppColors.whiteFFFFFF,
        hintText: hintText,
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
      items: items,
      onChanged: (value) {
        debugPrint("Selected: $value");
      },
    );
  }
}
