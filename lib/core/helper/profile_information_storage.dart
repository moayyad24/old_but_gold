import 'dart:convert';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';
import 'package:old_but_gold/features/profile/data/models/personal_information_model.dart';

class ProfileInformationStorage {
  static const String _key = 'personal_information';

  /// Save model
  static Future<void> save(PersonalInformationModel model) async {
    LocalStorageService prefs = getIt<LocalStorageService>();
    final jsonString = jsonEncode(model.toJson());
    await prefs.setString(_key, jsonString);
  }

  /// Load model
  static PersonalInformationModel? load() {
    LocalStorageService prefs = getIt<LocalStorageService>();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return null;

    final Map<String, dynamic> json = jsonDecode(jsonString);
    return PersonalInformationModel.fromJson(json);
  }
}
