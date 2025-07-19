import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';
import 'package:old_but_gold/core/widgets/content_area.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/features/auth/ui/widgets/custom_stepper.dart';
import 'package:old_but_gold/features/profile/ui/widgets/personal_information/date_picker_row.dart';
import 'package:old_but_gold/features/profile/ui/widgets/personal_information/first_and_last_name_field.dart';
import 'package:old_but_gold/features/profile/ui/widgets/personal_information/location_picker_field.dart';
import 'package:old_but_gold/features/profile/ui/widgets/personal_information/phone_number_field.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppBar(
            dots: [DotState.completed, DotState.completed, DotState.current],
          ),
          ContentArea(
            child: Column(
              children: [
                DragHandle(),
                SizedBox(height: 20.h),
                Text(
                  t.personalInfo.personalInformation,
                  style: AppTextStyles.bold26,
                ),
                SizedBox(height: 36.h),
                FirstAndLastNameField(),
                SizedBox(height: 30.h),
                DatePickerRow(
                  initialDate: DateTime(1998, 1, 1),
                  onDateSelected: (date) {
                    // print('Selected date: $date');
                  },
                ),
                SizedBox(height: 30.h),
                LocationPickerField(),
                SizedBox(height: 30.h),
                PhoneNumberField(
                  fieldTitle: t.personalInfo.phoneNumber,
                  hintText: '+213 542-382-179',
                  myController: TextEditingController(),
                  checkValid: (value) {
                    if (value == null || value.isEmpty) {
                      return t.personalInfo.pleaseEnterPhoneNumber;
                    }
                    return null;
                  },
                  countryCode: '+963', // Syria country code
                ),
                SizedBox(height: 40.h),
                Text(
                  t.personalInfo.weMayUseYourPhoneNumber,
                  style: AppTextStyles.medium14.copyWith(
                    color: AppColors.grey666666,
                  ),
                ),
                SizedBox(height: 35.h),
                AppConfirmButton(
                  text: t.personalInfo.confirmYourInfo,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
