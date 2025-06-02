import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/widgets/app_text_field.dart';

class FirstAndLastNameField extends StatelessWidget {
  const FirstAndLastNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextField(
            hintText: 'Required',
            fieldTitle: 'First Name',
            myController: TextEditingController(),
            checkValid: (_) {
              return null;
            },
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: AppTextField(
            hintText: 'Required',
            fieldTitle: 'Last Name',
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
