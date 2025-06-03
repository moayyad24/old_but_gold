import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class PhoneNumberField extends StatefulWidget {
  final String hintText;
  final String fieldTitle;
  final TextEditingController myController;
  final String? Function(String?)? checkValid;
  final String countryCode;
  final String countryFlag; // SVG asset path for flag

  const PhoneNumberField({
    super.key,
    required this.hintText,
    required this.fieldTitle,
    required this.myController,
    required this.checkValid,
    this.countryCode = '+1',
    this.countryFlag = 'assets/icons/eg_flag.svg',
  });

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  final FocusNode _focusNode = FocusNode();
  Color _color = AppColors.whiteFFFFFF;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _color = AppColors.blue0D87F9.withAlpha(30);
        });
      } else {
        setState(() {
          _color = AppColors.whiteFFFFFF;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.fieldTitle, style: AppTextStyles.medium14),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TextFormField(
                enabled: false,
                decoration: _buildInputDecoration(
                  prefixIcon: SvgPicture.asset(
                    widget.countryFlag,
                    width: 24.w,
                    height: 16.h,
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(start: 14.w),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 24,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.h),
            Expanded(
              flex: 3,
              child: TextFormField(
                focusNode: _focusNode,
                validator: widget.checkValid,
                controller: widget.myController,
                keyboardType: TextInputType.phone,
                style: AppTextStyles.medium16,
                cursorColor: AppColors.blue0D87F9,
                decoration: _buildInputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: AppColors.black,
                    size: 24,
                  ),
                  suffixIcon: Icon(
                    Icons.check_circle,
                    color: AppColors.green006A6F,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration({
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: _color,
      suffixIcon: suffixIcon,
      prefixIcon: Padding(
        padding: EdgeInsetsDirectional.only(start: 14.w),
        child: prefixIcon,
      ),
      isDense: true,
      hintText: widget.hintText,
      hintStyle: TextStyle(color: AppColors.darkGrey666666, fontSize: 16.sp),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.greyC2C2C2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.greyC2C2C2, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.blue2E8DFA, width: 1.5),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
