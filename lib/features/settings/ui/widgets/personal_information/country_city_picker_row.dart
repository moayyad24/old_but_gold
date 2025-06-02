import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/constants/test_constants.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/features/settings/ui/widgets/personal_information/choose_country_or_city.dart';

class CountryCityPickerRow extends StatefulWidget {
  final Function(String)? onCitySelected;
  const CountryCityPickerRow({super.key, this.onCitySelected});

  @override
  State<CountryCityPickerRow> createState() => _CountryCityPickerRowState();
}

class _CountryCityPickerRowState extends State<CountryCityPickerRow> {
  late TextEditingController _countryController;
  late TextEditingController _cityController;
  late String _selectedCity;
  late String _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = 'Syria';
    _countryController = TextEditingController(text: _selectedCountry);
    _selectedCity = 'Homs';
    _cityController = TextEditingController(text: _selectedCity);
  }

  _showCountryPicker(BuildContext context) async {
    final country = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => ChooseCountryOrCity(
              dataList: TConstants.arabicCountries,
              selectedData: _selectedCountry,
            ),
      ),
    );

    if (country != null) {
      setState(() {
        _selectedCountry = country;
        _countryController.text = country;
        _updateInfo();
      });
    }
  }

  _showCityPicker(BuildContext context) async {
    final city = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => ChooseCountryOrCity(
              dataList: TConstants.arabicCountries,
              selectedData: _selectedCity,
              isCity: true,
            ),
      ),
    );

    if (city != null) {
      setState(() {
        _selectedCity = city;
        _cityController.text = city;
        _updateInfo();
      });
    }
  }

  void _updateInfo() {
    widget.onCitySelected?.call(_selectedCity);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Country Field
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Country',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () => _showCountryPicker(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _countryController,
                    decoration: _buildDecoration(),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        //City Field
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'City',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () => _showCityPicker(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _cityController,
                    decoration: _buildDecoration(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  InputDecoration _buildDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.whiteFFFFFF,
      isDense: true,
      suffixIcon: Icon(Icons.unfold_more, size: 24),
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
