import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/app_bar_button.dart';
import 'package:old_but_gold/features/search/ui/widgets/filter_bottom_sheet.dart';

class AppSearchTextField extends StatelessWidget {
  const AppSearchTextField({
    super.key,
    this.searchController,
    required this.hintText,
    this.enabled = true,
    this.onPressed,
  });

  final TextEditingController? searchController;
  final String hintText;
  final bool enabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    Widget textField = TextField(
      controller: searchController,
      enabled: enabled,
      readOnly: !enabled, // Prevents keyboard popup if disabled
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteFAFAFA,
        hintText: hintText,
        isDense: true,
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.only(start: 16.w, end: 10),
          child: SvgPicture.asset('assets/icons/search_icon.svg'),
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 40).w,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: AppBarButton(
            icon: Icons.display_settings_sharp,
            onTap: () => FilterBottomSheet.show(context),
          ),
        ),
        hintStyle: AppTextStyles.medium18.copyWith(color: AppColors.grey666666),
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

    if (!enabled && onPressed != null) {
      return InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: onPressed,
        child: IgnorePointer(
          // To Prevents default TextField interaction
          child: textField,
        ),
      );
    }

    return textField;
  }
}
