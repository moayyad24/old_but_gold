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
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          focusNode: _focusNode,
          validator: widget.checkValid,
          controller: widget.myController,
          obscureText: widget.isObscure ? _obscureText : false,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            fontSize: 16,
          ),
          cursorColor: AppColors.blue0D87F9,
          decoration: InputDecoration(
            filled: true,
            fillColor: _color,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 14),
              child: SvgPicture.asset(widget.iconPath),
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 40),
            isDense: true,
            suffixIcon:
                widget.isObscure
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
