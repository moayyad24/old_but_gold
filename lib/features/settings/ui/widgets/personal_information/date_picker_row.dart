import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:old_but_gold/features/settings/ui/widgets/personal_information/choose_date.dart';

class DatePickerRow extends StatefulWidget {
  final Function(DateTime)? onDateSelected;
  final DateTime? initialDate;

  const DatePickerRow({super.key, this.onDateSelected, this.initialDate});

  @override
  State<DatePickerRow> createState() => _DatePickerRowState();
}

class _DatePickerRowState extends State<DatePickerRow> {
  late TextEditingController _monthController;
  late TextEditingController _dayController;
  late TextEditingController _yearController;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime.now();
    _monthController = TextEditingController(
      text: _getMonthName(_selectedDate.month),
    );
    _dayController = TextEditingController(
      text: _formatNumber(_selectedDate.day),
    );
    _yearController = TextEditingController(
      text: _selectedDate.year.toString(),
    );
  }

  @override
  void dispose() {
    _monthController.dispose();
    _dayController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  String _getMonthName(int monthNumber) {
    final date = DateTime(2000, monthNumber);
    return DateFormat('MMM').format(date);
  }

  String _formatNumber(int number) => number.toString().padLeft(2, '0');

  Future<void> _showDatePicker(BuildContext context) async {
    final date = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChooseDate()),
    );

    if (date != null) {
      setState(() {
        _selectedDate = DateTime(date.year, date.month, date.day);
        _yearController.text = _selectedDate.year.toString();
        _monthController.text = _getMonthName(_selectedDate.month);
        _dayController.text = _formatNumber(_selectedDate.day);
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
        Text(
          'Date of Birth',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () => _showDatePicker(context),
          child: Row(
            children: [
              // Month Field
              Expanded(
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _monthController,
                    decoration: _buildDecoration('MM'),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              // Day Field
              Expanded(
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _dayController,
                    decoration: _buildDecoration('DD'),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              // Year Field
              Expanded(
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _yearController,
                    decoration: _buildDecoration('YYYY'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  InputDecoration _buildDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.whiteFFFFFF,
      isDense: true,
      hintText: hint,
      suffixIcon: Icon(Icons.unfold_more, size: 24),
      hintStyle: TextStyle(color: AppColors.darkGrey666666, fontSize: 16.sp),
      contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 17.w),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.greyC2C2C2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.greyC2C2C2, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.blue2E8DFA, width: 1.5),
      ),
    );
  }
}
