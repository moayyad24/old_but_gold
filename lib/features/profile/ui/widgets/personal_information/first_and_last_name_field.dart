import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/helper/input_validator.dart';
import 'package:old_but_gold/core/widgets/app_text_field.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class FirstAndLastNameField extends StatelessWidget {
  final TextEditingController firstName;
  final TextEditingController lastName;
  const FirstAndLastNameField({
    super.key,
    required this.firstName,
    required this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextField(
            hintText: t.personalInfo.required,
            fieldTitle: t.personalInfo.firstName,
            myController: firstName,
            checkValid: (v) {
              return InputValidator.validateUsername(v!);
            },
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: AppTextField(
            hintText: t.personalInfo.required,
            fieldTitle: t.personalInfo.lastName,
            myController: lastName,
            checkValid: (v) {
              return InputValidator.validateUsername(v!);
            },
          ),
        ),
      ],
    );
  }
}
