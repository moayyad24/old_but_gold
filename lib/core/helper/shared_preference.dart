import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  static SharedPreferences? _preferences;

  // Initialize SharedPreferences
  Future<void> init() async {
    try {
      logger.i('Initializing SharedPreferences...');
      _preferences = await SharedPreferences.getInstance();
      logger.i('SharedPreferences initialized successfully');
    } catch (e, stackTrace) {
      logger.e(
        'Failed to initialize SharedPreferences',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Generic getter
  dynamic getFromDisk(String key) {
    try {
      logger.d('Getting value from disk for key: $key');
      final value = _preferences?.get(key);
      logger.t('Retrieved value: $value (Type: ${value?.runtimeType})');
      return value;
    } catch (e, stackTrace) {
      logger.e(
        'Error getting value for key: $key',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Generic setter
  Future<void> saveToDisk<T>(String key, T content) async {
    try {
      if (content == null) {
        logger.w('Removing key $key because content is null');
        await _preferences?.remove(key);
        return;
      }

      logger.d('Saving to disk - Key: $key | Value: $content | Type: $T');

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
          logger.e('Unsupported type $T for key: $key');
          throw Exception('Type $T is not supported');
      }

      logger.i('Successfully saved value for key: $key');
    } catch (e, stackTrace) {
      logger.e(
        'Error saving value for key: $key',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Clear all data
  Future<void> clearStorage() async {
    try {
      logger.w('Clearing all storage data');
      await _preferences?.clear();
      logger.i('Storage cleared successfully');
    } catch (e, stackTrace) {
      logger.e('Error clearing storage', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // Specific getters/setters with enhanced logging
  String? getString(String key) {
    logger.d('Getting string for key: $key');
    final value = _preferences?.getString(key);
    logger.t('Retrieved string: $value');
    return value;
  }

  Future<bool> setString(String key, String value) async {
    logger.d('Setting string - Key: $key | Value: $value');
    final result = await _preferences?.setString(key, value) ?? false;
    if (result) {
      logger.i('String saved successfully for key: $key');
    } else {
      logger.w('Failed to save string for key: $key');
    }
    return result;
  }

  int? getInt(String key) {
    logger.d('Getting int for key: $key');
    final value = _preferences?.getInt(key);
    logger.t('Retrieved int: $value');
    return value;
  }

  Future<bool> setInt(String key, int value) async {
    logger.d('Setting int - Key: $key | Value: $value');
    final result = await _preferences?.setInt(key, value) ?? false;
    if (result) {
      logger.i('Int saved successfully for key: $key');
    } else {
      logger.w('Failed to save int for key: $key');
    }
    return result;
  }

  bool? getBool(String key) {
    logger.d('Getting bool for key: $key');
    final value = _preferences?.getBool(key);
    logger.t('Retrieved bool: $value');
    return value;
  }

  Future<bool> setBool(String key, bool value) async {
    logger.d('Setting bool - Key: $key | Value: $value');
    final result = await _preferences?.setBool(key, value) ?? false;
    if (result) {
      logger.i('Bool saved successfully for key: $key');
    } else {
      logger.w('Failed to save bool for key: $key');
    }
    return result;
  }

  double? getDouble(String key) {
    logger.d('Getting double for key: $key');
    final value = _preferences?.getDouble(key);
    logger.t('Retrieved double: $value');
    return value;
  }

  Future<bool> setDouble(String key, double value) async {
    logger.d('Setting double - Key: $key | Value: $value');
    final result = await _preferences?.setDouble(key, value) ?? false;
    if (result) {
      logger.i('Double saved successfully for key: $key');
    } else {
      logger.w('Failed to save double for key: $key');
    }
    return result;
  }

  List<String>? getStringList(String key) {
    logger.d('Getting string list for key: $key');
    final value = _preferences?.getStringList(key);
    logger.t('Retrieved string list: $value');
    return value;
  }

  Future<bool> setStringList(String key, List<String> value) async {
    logger.d('Setting string list - Key: $key | Value: $value');
    final result = await _preferences?.setStringList(key, value) ?? false;
    if (result) {
      logger.i('String list saved successfully for key: $key');
    } else {
      logger.w('Failed to save string list for key: $key');
    }
    return result;
  }

  /// Secure storage methods
  Future<void> setSecuredString(String key, String value) async {
    try {
      logger.d('Setting secured string - Key: $key');
      const storage = FlutterSecureStorage();
      await storage.write(key: key, value: value);
      logger.i('Secured string saved successfully for key: $key');
    } catch (e, stackTrace) {
      logger.e(
        'Error saving secured string for key: $key',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<String?> getSecuredString(String key) async {
    try {
      logger.d('Getting secured string for key: $key');
      const storage = FlutterSecureStorage();
      final value = await storage.read(key: key);
      logger.t('Retrieved secured string: ${value != null ? '*****' : 'null'}');
      return value;
    } catch (e, stackTrace) {
      logger.e(
        'Error getting secured string for key: $key',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
