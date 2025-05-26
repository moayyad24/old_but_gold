import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class AuthField extends StatefulWidget {
  final String hintText;
  final String fieldTitle;
  final String iconPath;
  final TextEditingController myController;
  final String? Function(String?)? checkValid;
  final bool isObscure;

  const AuthField({
    super.key,
    required this.hintText,
    required this.fieldTitle,
    required this.iconPath,
    required this.myController,
    required this.checkValid,
    this.isObscure = false,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          validator: widget.checkValid,
          controller: widget.myController,
          obscureText: widget.isObscure ? _obscureText : true,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            fontSize: 16,
          ),
          cursorColor: AppColors.greyC2C2C2,
          decoration: InputDecoration(
            fillColor: AppColors.whiteFFFFFF,
            filled: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: SvgPicture.asset(widget.iconPath),
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 50),
            isDense: true,
            suffixIcon:
                widget.isObscure
                    ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                    : null,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: AppColors.darkGrey666666,
              fontSize: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.greyC2C2C2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.greyC2C2C2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.greyC2C2C2),
            ),
          ),
        ),
      ],
    );
  }
}
