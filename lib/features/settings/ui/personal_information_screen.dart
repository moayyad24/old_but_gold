import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';
import 'package:old_but_gold/core/widgets/content_area.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/features/auth/ui/widgets/custom_stepper.dart';
import 'package:old_but_gold/features/settings/ui/widgets/personal_information/country_city_picker_row.dart';
import 'package:old_but_gold/features/settings/ui/widgets/personal_information/date_picker_row.dart';
import 'package:old_but_gold/features/settings/ui/widgets/personal_information/first_and_last_name_field.dart';
import 'package:old_but_gold/features/settings/ui/widgets/personal_information/phone_number_field.dart';

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
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 36.h),
                FirstAndLastNameField(),
                SizedBox(height: 30.h),
                DatePickerRow(
                  initialDate: DateTime(1998, 1, 1),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  onDateSelected: (date) {
                    // print('Selected date: $date');
                  },
                ),
                SizedBox(height: 30.h),
                CountryCityPickerRow(
                  onCitySelected: (city) {
                    // print(city);
                  },
                ),
                SizedBox(height: 30.h),
                PhoneNumberField(
                  fieldTitle: 'Phone Number',
                  hintText: '+213 542-382-179',
                  myController: TextEditingController(),
                  checkValid: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phone number';
                    }
                    return null;
                  },
                  countryCode: '+963', // Syria country code
                ),
                SizedBox(height: 40.h),
                Text(
                  'We may use your phone number to send you messages with information regarding your account',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.grey666666,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 52.h),
                AppConfirmButton(text: 'Confirm Your Info', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
