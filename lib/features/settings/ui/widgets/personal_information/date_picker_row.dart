import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:intl/intl.dart';

class DatePickerRow extends StatefulWidget {
  final Function(DateTime)? onDateSelected;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const DatePickerRow({
    super.key,
    this.onDateSelected,
    this.initialDate,
    this.firstDate,
    this.lastDate,
  });

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

  Future<void> _showMonthPicker(BuildContext context) async {
    final month = await showDialog<int>(
      context: context,
      builder:
          (context) => _MonthPickerDialog(selectedMonth: _selectedDate.month),
    );

    if (month != null) {
      setState(() {
        _selectedDate = DateTime(_selectedDate.year, month, _selectedDate.day);
        _monthController.text = _getMonthName(month);
        _updateDate();
      });
    }
  }

  Future<void> _showDayPicker(BuildContext context) async {
    final lastDay =
        DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
    final day = await showDialog<int>(
      context: context,
      builder:
          (context) => _DayPickerDialog(
            selectedDay: _selectedDate.day,
            lastDay: lastDay,
          ),
    );

    if (day != null) {
      setState(() {
        _selectedDate = DateTime(_selectedDate.year, _selectedDate.month, day);
        _dayController.text = _formatNumber(day);
        _updateDate();
      });
    }
  }

  Future<void> _showYearPicker(BuildContext context) async {
    final year = await showDialog<int>(
      context: context,
      builder:
          (context) => _YearPickerDialog(
            selectedYear: _selectedDate.year,
            firstYear: widget.firstDate?.year ?? 1900,
            lastYear: widget.lastDate?.year ?? DateTime.now().year + 100,
          ),
    );

    if (year != null) {
      setState(() {
        final lastDay = DateTime(year, _selectedDate.month + 1, 0).day;
        final day = _selectedDate.day > lastDay ? lastDay : _selectedDate.day;
        _selectedDate = DateTime(year, _selectedDate.month, day);
        _yearController.text = year.toString();
        _dayController.text = _formatNumber(day);
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
        Row(
          children: [
            // Month Field
            Expanded(
              child: GestureDetector(
                onTap: () => _showMonthPicker(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _monthController,
                    decoration: _buildDecoration('MM'),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            // Day Field
            Expanded(
              child: GestureDetector(
                onTap: () => _showDayPicker(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _dayController,
                    decoration: _buildDecoration('DD'),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            // Year Field
            Expanded(
              child: GestureDetector(
                onTap: () => _showYearPicker(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _yearController,
                    decoration: _buildDecoration('YYYY'),
                  ),
                ),
              ),
            ),
          ],
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

// Custom Month Picker Dialog
class _MonthPickerDialog extends StatelessWidget {
  final int selectedMonth;

  const _MonthPickerDialog({required this.selectedMonth});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Month'),
      content: SizedBox(
        width: double.maxFinite,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            final month = index + 1;
            return TextButton(
              onPressed: () => Navigator.pop(context, month),
              style: TextButton.styleFrom(
                foregroundColor:
                    month == selectedMonth
                        ? AppColors.blue0D87F9
                        : AppColors.black,
              ),
              child: Text(DateTime(2000, month).toString().substring(5, 7)),
            );
          },
        ),
      ),
    );
  }
}

// Custom Day Picker Dialog
class _DayPickerDialog extends StatelessWidget {
  final int selectedDay;
  final int lastDay;

  const _DayPickerDialog({required this.selectedDay, required this.lastDay});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Day'),
      content: SizedBox(
        width: double.maxFinite,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            childAspectRatio: 1,
          ),
          itemCount: lastDay,
          itemBuilder: (context, index) {
            final day = index + 1;
            return TextButton(
              onPressed: () => Navigator.pop(context, day),
              style: TextButton.styleFrom(
                foregroundColor:
                    day == selectedDay ? AppColors.blue0D87F9 : AppColors.black,
              ),
              child: Text(day.toString()),
            );
          },
        ),
      ),
    );
  }
}

// Custom Year Picker Dialog
class _YearPickerDialog extends StatelessWidget {
  final int selectedYear;
  final int firstYear;
  final int lastYear;

  const _YearPickerDialog({
    required this.selectedYear,
    required this.firstYear,
    required this.lastYear,
  });

  @override
  Widget build(BuildContext context) {
    final years = List.generate(
      lastYear - firstYear + 1,
      (index) => lastYear - index,
    );

    return AlertDialog(
      title: const Text('Select Year'),
      content: SizedBox(
        width: double.maxFinite,
        height: 300,
        child: ListView.builder(
          itemCount: years.length,
          itemBuilder: (context, index) {
            final year = years[index];
            return ListTile(
              title: Text(
                year.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:
                      year == selectedYear
                          ? AppColors.blue0D87F9
                          : AppColors.black,
                  fontWeight:
                      year == selectedYear
                          ? FontWeight.bold
                          : FontWeight.normal,
                ),
              ),
              onTap: () => Navigator.pop(context, year),
            );
          },
        ),
      ),
    );
  }
}
