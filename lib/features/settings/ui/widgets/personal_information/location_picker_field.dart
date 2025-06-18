import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:old_but_gold/core/widgets/app_text_field.dart';
import 'package:old_but_gold/features/settings/ui/widgets/personal_information/map_location_picker.dart';

class LocationPickerField extends StatelessWidget {
  const LocationPickerField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final selectedLocation = await Navigator.push<LatLng>(
          context,
          MaterialPageRoute(builder: (context) => const MapLocationPicker()),
        );
        if (selectedLocation != null) {
          //ToDo: implement this
          print('${selectedLocation.latitude}, ${selectedLocation.longitude}');
          // Update your TextField with the selected location
          // myController.text =
          //     '${selectedLocation.latitude}, ${selectedLocation.longitude}';
        }
      },
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
