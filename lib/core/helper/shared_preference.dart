import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  static SharedPreferences? _preferences;

  // Initialize SharedPreferences
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Generic getter
  dynamic getFromDisk(String key) {
    final value = _preferences?.get(key);
    return value;
  }

  // Generic setter
  Future<void> saveToDisk<T>(String key, T content) async {
    if (content == null) {
      await _preferences?.remove(key);
      return;
    }

    switch (T) {
      case const (String):
        await _preferences?.setString(key, content as String);
        break;
      case const (int):
        await _preferences?.setInt(key, content as int);
        break;
      case const (bool):
        await _preferences?.setBool(key, content as bool);
        break;
      case const (double):
        await _preferences?.setDouble(key, content as double);
        break;
      case const (List<String>):
        await _preferences?.setStringList(key, content as List<String>);
        break;
      default:
        throw Exception('Type $T is not supported');
    }
  }

  // Clear all data
  Future<void> clearStorage() async {
    await _preferences?.clear();
  }

  // Specific getters/setters for better type safety
  String? getString(String key) => _preferences?.getString(key);
  Future<bool> setString(String key, String value) =>
      _preferences?.setString(key, value) ?? Future.value(false);

  int? getInt(String key) => _preferences?.getInt(key);
  Future<bool> setInt(String key, int value) =>
      _preferences?.setInt(key, value) ?? Future.value(false);

  bool? getBool(String key) => _preferences?.getBool(key);
  Future<bool> setBool(String key, bool value) =>
      _preferences?.setBool(key, value) ?? Future.value(false);

  double? getDouble(String key) => _preferences?.getDouble(key);
  Future<bool> setDouble(String key, double value) =>
      _preferences?.setDouble(key, value) ?? Future.value(false);

  List<String>? getStringList(String key) => _preferences?.getStringList(key);
  Future<bool> setStringList(String key, List<String> value) =>
      _preferences?.setStringList(key, value) ?? Future.value(false);

  /// Set a secure value with a FlutterSecureStorage
  Future<void> setSecuredString(String key, String value) async {
    final storage = FlutterSecureStorage();
    return await storage.write(key: key, value: value);
  }

  /// get a secure value from a FlutterSecureStorage
  Future<String?> getSecuredString(String key, String value) async {
    final storage = FlutterSecureStorage();
    return await storage.read(key: key);
  }
}
