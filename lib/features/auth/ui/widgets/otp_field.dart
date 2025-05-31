import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class OtpField extends StatefulWidget {
  final ValueChanged<String>? onCompleted;

  final double borderRadius;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color fillColor;
  final bool obscureText;
  final String obscureCharacter;

  const OtpField({
    super.key,
    this.onCompleted,
    this.borderRadius = 8,
    this.borderColor = AppColors.greyB7B7B7,
    this.focusedBorderColor = AppColors.blue2E8DFA,
    this.fillColor = AppColors.whiteFFFFFF,
    this.obscureText = false,
    this.obscureCharacter = '•',
  });

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.length == 1) {
      if (index < 3) {
        _focusNodes[index].unfocus();
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        _focusNodes[index].unfocus();
        _collectOtp();
      }
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index].unfocus();
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  void _collectOtp() {
    final otp = _controllers.map((e) => e.text).join();
    if (otp.length == 4) {
      widget.onCompleted?.call(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        width: 245.w,
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return SizedBox(
              width: 50.w,
              height: 50.h,
              child: TextFormField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                obscureText: widget.obscureText,
                obscuringCharacter: widget.obscureCharacter,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: widget.fillColor,
                  contentPadding: EdgeInsets.zero,
                  counterText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: BorderSide(color: widget.borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: BorderSide(color: widget.borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: BorderSide(
                      color: widget.focusedBorderColor,
                      width: 2,
                    ),
                  ),
                ),
                onChanged: (value) => _onChanged(index, value),
              ),
            );
          }),
        ),
      ),
    );
  }
}
