import 'package:flutter/material.dart';
import 'package:old_but_gold/core/widgets/app_text_field.dart';
import 'package:old_but_gold/features/settings/ui/widgets/personal_information/map_location_picker.dart';

class LocationPickerField extends StatefulWidget {
  const LocationPickerField({super.key});

  @override
  State<LocationPickerField> createState() => _LocationPickerFieldState();
}

class _LocationPickerFieldState extends State<LocationPickerField> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final selectedLocation = await Navigator.push<String>(
          context,
          MaterialPageRoute(builder: (context) => const MapLocationPicker()),
        );
        if (selectedLocation != null) {
          controller.text = selectedLocation;
        }
      },
      child: AbsorbPointer(
        child: AppTextField(
          hintText: 'Enter your location',
          fieldTitle: 'Location',
          myController: controller,
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
