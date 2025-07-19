import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/widgets/app_text_field.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class FirstAndLastNameField extends StatelessWidget {
  const FirstAndLastNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextField(
            hintText: t.personalInfo.required,
            fieldTitle: t.personalInfo.firstName,
            myController: TextEditingController(),
            checkValid: (_) {
              return null;
            },
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: AppTextField(
            hintText: t.personalInfo.required,
            fieldTitle: t.personalInfo.lastName,
            myController: TextEditingController(),
            checkValid: (_) {
              return null;
            },
          ),
        ),
      ],
    );
  }
}
