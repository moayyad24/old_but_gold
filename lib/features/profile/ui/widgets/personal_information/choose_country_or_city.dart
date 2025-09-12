import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';
import 'package:old_but_gold/core/widgets/search_text_field.dart';
import 'package:old_but_gold/core/widgets/text_with_icon_app_bar.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class ChooseCountryOrCity extends StatefulWidget {
  final List<Map<String, String>> dataList;
  final String? selectedData;
  final bool isCity;

  const ChooseCountryOrCity({
    super.key,
    required this.dataList,
    this.selectedData,
    this.isCity = false,
  });

  @override
  State<ChooseCountryOrCity> createState() => _ChooseCountryOrCityState();
}

class _ChooseCountryOrCityState extends State<ChooseCountryOrCity> {
  late List<Map<String, String>> _filteredData;
  String _selectedData = 'syria';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredData = widget.dataList;
    _selectedData = widget.selectedData!;
    _searchController.addListener(_filterData);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterData() {
    setState(() {
      final query = _searchController.text.toLowerCase();
      _filteredData =
          widget.dataList.where((item) {
            return item['name']!.toLowerCase().contains(query) ||
                item['ar']!.toLowerCase().contains(query);
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: UiParameters.dPadding,
            child: Column(
              children: [
                TextWithIconAppBar(
                  title:
                      !widget.isCity
                          ? t.personalInfo.chooseCountry
                          : t.personalInfo.chooseCity,
                ),
                SizedBox(height: 20.h),
                SearchTextField(
                  searchController: _searchController,
                  hintText:
                      !widget.isCity
                          ? t.personalInfo.searchForCountryName
                          : t.personalInfo.searchForCityName,
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _filteredData.length,
              padding: EdgeInsets.only(top: 30).r,
              itemBuilder: (context, index) {
                final data = _filteredData[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedData = data['name']!;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 24, right: 24).r,
                    decoration: BoxDecoration(
                      color:
                          _selectedData == data['name']!
                              ? Color(0xFFFFF7E6)
                              : null,
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: AppColors.greyB7B7B7,
                        ),
                      ),
                    ),
                    height: 60.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 16.h,
                              width: 16.w,
                              margin: EdgeInsetsDirectional.only(
                                start: 5,
                                end: 22,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    _selectedData == data['name']!
                                        ? AppColors.mainFFE09C
                                        : AppColors.greyF8F8F8,
                                border: Border.all(
                                  color: AppColors.greyB7B7B7,
                                  width: 2,
                                ),
                              ),
                            ),
                            SvgPicture.asset('assets/icons/eg_flag.svg'),
                            SizedBox(width: 15.w),
                            SizedBox(
                              width: 1.sw / 4.5,
                              child: Text(
                                LocaleSettings.currentLocale == AppLocale.ar
                                    ? data['ar']!
                                    : data['name']!,
                                style: AppTextStyles.medium20,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 6.h,
                              width: 6.w,
                              margin: EdgeInsetsDirectional.only(end: 15),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.darkGrey666666,
                              ),
                            ),
                            SizedBox(
                              width: 50.w,
                              child: Text(
                                data['dial_code']!,
                                style: AppTextStyles.medium20,
                                textDirection: TextDirection.ltr,
                              ),
                            ),
                            Container(
                              width: 39.w,
                              height: 36.h,
                              margin: EdgeInsetsDirectional.only(
                                start: 15,
                                end: 5,
                              ),
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: AppColors.blue7FB3B5,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/phone_icon.svg',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 95.h,
            padding:
                EdgeInsets.only(left: 24, right: 24, top: 18, bottom: 27).r,
            decoration: BoxDecoration(
              color: AppColors.whiteFFFDF2,
              border: Border(
                top: BorderSide(width: 1, color: AppColors.greyB7B7B7),
              ),
            ),
            child: AppConfirmButton(
              onPressed: () => Navigator.pop(context, _selectedData),
              text:
                  !widget.isCity
                      ? t.personalInfo.confirmYourCountry
                      : t.personalInfo.confirmYourCity,
            ),
          ),
        ],
      ),
    );
  }
}
