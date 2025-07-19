import 'package:adoptive_calendar/adoptive_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';
import 'package:old_but_gold/features/settings/ui/widgets/text_with_icon_app_bar.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class ChooseDate extends StatelessWidget {
  const ChooseDate({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: UiParameters.dPadding,
            child: TextWithIconAppBar(title: t.personalInfo.chooseDateOfBirth),
          ),
          Spacer(flex: 3),
          AdoptiveCalendar(
            initialDate: DateTime(1990, 01, 01),
            minYear: 1940,
            maxYear: DateTime.now().year,
            datePickerOnly: true,
            fontColor: Colors.black,
            selectedColor: AppColors.mainFFE09C,
            backgroundColor: AppColors.whiteFFFFFF,
            contentPadding: EdgeInsets.only(left: 16, right: 16, top: 16),
            onSelection: (date) {
              selectedDate = date;
            },
          ),
          Spacer(),
          Padding(
            padding: UiParameters.hPadding,
            child: Column(
              children: [
                Text(
                  t.personalInfo.weMayUseYourDateOfBirth,
                  style: AppTextStyles.medium14.copyWith(
                    color: AppColors.grey666666,
                  ),
                ),
                50.verticalSpace,
                AppConfirmButton(
                  text: t.personalInfo.confirmYourInfo,
                  onPressed: () {
                    Navigator.pop(context, selectedDate);
                  },
                ),
              ],
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
