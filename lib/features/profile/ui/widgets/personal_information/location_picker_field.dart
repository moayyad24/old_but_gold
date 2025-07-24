import 'package:flutter/material.dart';
import 'package:old_but_gold/core/widgets/app_text_field.dart';
import 'package:old_but_gold/features/profile/ui/widgets/personal_information/map_location_picker.dart';

class LocationPickerField extends StatelessWidget {
  final TextEditingController location;
  const LocationPickerField({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        final selectedLocation = await Navigator.push<String>(
          context,
          MaterialPageRoute(builder: (context) => const MapLocationPicker()),
        );
        if (selectedLocation != null) {
          location.text = selectedLocation;
        }
      },
      child: AbsorbPointer(
        child: AppTextField(
          hintText: 'Enter your location',
          fieldTitle: 'Location',
          myController: location,
          prefixIconPath: 'assets/icons/map_pin.svg',
          suffixIcon: Icons.map_rounded,
        ),
      ),
    );
  }
}
