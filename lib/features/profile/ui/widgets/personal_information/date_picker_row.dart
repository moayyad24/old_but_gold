import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/features/profile/ui/widgets/personal_information/choose_date.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class DatePickerRow extends StatefulWidget {
  final Function(DateTime)? onDateSelected;
  final DateTime? initialDate;

  const DatePickerRow({super.key, this.onDateSelected, this.initialDate});

  @override
  State<DatePickerRow> createState() => _DatePickerRowState();
}

class _DatePickerRowState extends State<DatePickerRow> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime.now();
  }

  String _getMonthName(int monthNumber) {
    final date = DateTime(2000, monthNumber);
    return DateFormat(
      'MMM',
      LocaleSettings.currentLocale.languageCode,
    ).format(date);
  }

  String _formatNumber(int number) => number.toString().padLeft(2, '0');

  Future<void> _showDatePicker(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    final date = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChooseDate()),
    );

    if (date != null) {
      setState(() {
        _selectedDate = DateTime(date.year, date.month, date.day);
        _updateDate();
      });
    }
  }

  void _updateDate() {
    widget.onDateSelected?.call(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.personalInfo.dateOfBirth, style: AppTextStyles.medium14),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () => _showDatePicker(context),
          child: Row(
            children: [
              // Day Field
              Expanded(
                flex: 3,
                child: _buildContainer(_formatNumber(_selectedDate.day)),
              ),
              SizedBox(width: 10.w),
              // Month Field
              Expanded(
                flex: 5,
                child: _buildContainer(_getMonthName(_selectedDate.month)),
              ),
              SizedBox(width: 10.w),
              // Year Field
              Expanded(
                flex: 4,
                child: _buildContainer(_selectedDate.year.toString()),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContainer(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.greyC2C2C2, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10.0),
            child: Text(text, style: AppTextStyles.medium14),
          ),
          Icon(Icons.unfold_more, size: 24, color: AppColors.black),
        ],
      ),
    );
  }
}
