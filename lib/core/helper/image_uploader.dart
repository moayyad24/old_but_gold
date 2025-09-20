import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageUploader {
  static Future<File?> uploadImage() async {
    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );

    if (file != null) {
      return File(file.path);
    } else {
      return null;
    }
  }
}
