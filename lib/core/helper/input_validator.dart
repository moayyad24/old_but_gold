// Enum for input types
import 'package:old_but_gold/i18n/strings.g.dart';

enum InputType { username, email, password, phone }

class InputValidator {
  // Constants for validation patterns
  static const String _usernamePattern = r'^[a-zA-Z0-9_ ]{3,30}$';
  static const String _emailPattern =
      r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';
  static const String _passwordPattern =
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$';
  static const String _phonePattern =
      r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

  // Validation methods
  static bool isValidUsername(String username) =>
      RegExp(_usernamePattern).hasMatch(username);

  static bool isValidEmail(String email) =>
      RegExp(_emailPattern).hasMatch(email);

  static bool isValidPassword(String password) =>
      RegExp(_passwordPattern).hasMatch(password);

  static bool isValidPhone(String phone) =>
      RegExp(_phonePattern).hasMatch(phone);

  // Main validation method
  static String? validateInput({
    required String value,
    required int minLength,
    required int maxLength,
    required InputType type,
    bool isRequired = true,
  }) {
    // Check for empty value
    if (isRequired && value.isEmpty) {
      return t.validator.thisFieldCannotBeEmpty;
    }

    // Skip further validation if empty and not required
    if (value.isEmpty) return null;

    // Length validation
    if (value.length < minLength) {
      return t.validator.mustBeAtLeastCharacters(minLength: minLength);
    }
    if (value.length > maxLength) {
      return t.validator.cannotExceedCharacters(maxLength: maxLength);
    }

    // Type-specific validation
    switch (type) {
      case InputType.username:
        if (!isValidUsername(value)) {
          return t
              .validator
              .usernameCanOnlyContainLettersNumbersSpacesAndUnderscores;
        }
        break;
      case InputType.email:
        if (!isValidEmail(value)) {
          return t.validator.pleaseEnterAValidEmailAddress;
        }
        break;
      case InputType.password:
        if (!isValidPassword(value)) {
          return t
              .validator
              .passwordMustBeAtLeast8CharactersWithAtLeastOneLetterAndOneNumber;
        }
        break;
      case InputType.phone:
        if (!isValidPhone(value)) {
          return t.validator.pleaseEnterAValidPhoneNumber;
        }
        break;
    }

    return null;
  }

  // Convenience methods with common defaults
  static String? validateUsername(String value) => validateInput(
    value: value,
    minLength: 3,
    maxLength: 30,
    type: InputType.username,
  );

  static String? validateEmail(String value) => validateInput(
    value: value,
    minLength: 5,
    maxLength: 50,
    type: InputType.email,
  );

  static String? validatePassword(String value) => validateInput(
    value: value,
    minLength: 8,
    maxLength: 50,
    type: InputType.password,
  );

  static String? validatePhone(String value) => validateInput(
    value: value,
    minLength: 8,
    maxLength: 15,
    type: InputType.phone,
  );
}
