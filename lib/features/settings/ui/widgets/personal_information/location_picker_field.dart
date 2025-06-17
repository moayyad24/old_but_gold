import 'package:flutter/material.dart';
import 'package:old_but_gold/core/widgets/app_text_field.dart';

class LocationPickerField extends StatelessWidget {
  const LocationPickerField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AbsorbPointer(
        child: AppTextField(
          hintText: 'Enter your location',
          fieldTitle: 'Location',
          myController: TextEditingController(),
          prefixIconPath: 'assets/icons/map_pin.svg',
          suffixIcon: Icons.map_rounded,
          checkValid: (value) {
            return '';
          },
        ),
      ),
    );
  }
}
