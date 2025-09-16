import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final String fieldTitle;
  final String? prefixIconPath;
  final IconData? suffixIcon;
  final TextEditingController myController;
  final String? Function(String?)? checkValid;
  final bool isObscure;
  final int? maxLines;

  const AppTextField({
    super.key,
    required this.hintText,
    required this.fieldTitle,
    this.prefixIconPath,
    this.suffixIcon,
    required this.myController,
    this.checkValid,
    this.isObscure = false,
    this.maxLines,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;
  final FocusNode _focusNode = FocusNode();
  Color _color = AppColors.whiteFFFFFF;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscure;
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
        Text(
          widget.fieldTitle,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          focusNode: _focusNode,
          validator: widget.checkValid,
          controller: widget.myController,
          maxLines: widget.maxLines,
          obscureText: widget.isObscure ? _obscureText : false,
          style: AppTextStyles.medium16,
          cursorColor: AppColors.blue0D87F9,
          decoration: InputDecoration(
            filled: true,
            fillColor: _color,
            prefixIcon: widget.prefixIconPath != null
                ? Padding(
                    padding: EdgeInsetsDirectional.only(start: 14.w),
                    child: SvgPicture.asset(widget.prefixIconPath!),
                  )
                : null,
            prefixIconConstraints: BoxConstraints(minWidth: 40).w,
            isDense: true,
            suffixIcon: widget.isObscure
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.grey666666,
                      size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : widget.suffixIcon != null
                ? Icon(widget.suffixIcon, color: AppColors.black, size: 24)
                : null,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: AppColors.darkGrey666666,
              fontSize: 16.sp,
            ),
            errorMaxLines: 2,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.greyC2C2C2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.greyC2C2C2,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.blue2E8DFA,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
