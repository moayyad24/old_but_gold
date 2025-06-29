import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class AppTheme {
  AppLocale currentLocale = LocaleSettings.currentLocale;

  ThemeData get defaultTheme => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.whiteFFFFFF,
    fontFamily: currentLocale == AppLocale.en ? 'Manrope' : 'Tajawal',
    colorScheme: _colorScheme,
    appBarTheme: _appBarTheme,
    buttonTheme: _buttonTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    cardTheme: _cardTheme,
    dividerTheme: _dividerTheme,
  );

  static ColorScheme get _colorScheme => ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.green006A6F,
    onPrimary: AppColors.whiteFFFFFF,
    secondary: AppColors.blue0D87F9,
    onSecondary: AppColors.whiteFFFFFF,
    error: Colors.red[700]!,
    onError: AppColors.whiteFFFFFF,
    surface: AppColors.whiteFFFFFF,
    onSurface: AppColors.darkBlue02314C,
  );

  static AppBarTheme get _appBarTheme => AppBarTheme(
    backgroundColor: AppColors.whiteFFFFFF,
    foregroundColor: AppColors.darkBlue02314C,
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: AppColors.darkBlue02314C),
    titleTextStyle: _textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w700,
    ),
  );

  static ButtonThemeData get _buttonTheme => const ButtonThemeData(
    buttonColor: AppColors.green006A6F,
    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );

  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainFFE09C,
          foregroundColor: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0.2,
          shadowColor: AppColors.greyC2C2C2,
        ),
      );

  static TextTheme get _textTheme => TextTheme(
    displayLarge: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      color: AppColors.darkBlue02314C,
    ),
    displayMedium: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: AppColors.darkBlue02314C,
    ),
    titleLarge: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColors.darkBlue02314C,
    ),
    titleMedium: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.darkBlue02314C,
    ),
    bodyLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.darkGrey666666,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.greyB7B7B7,
    ),
    labelLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteFFFFFF,
    ),
  );

  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: AppColors.greyF8F8F8,
    contentPadding: const EdgeInsets.all(16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.blue2E8DFA, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.red[700]!, width: 1.5),
    ),
    hintStyle: TextStyle(color: AppColors.greyB7B7B7, fontSize: 14),
  );

  static CardThemeData get _cardTheme => const CardThemeData(
    color: AppColors.whiteFFFFFF,
    elevation: 2,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    shadowColor: AppColors.greyC2C2C2,
  );

  static DividerThemeData get _dividerTheme =>
      DividerThemeData(color: AppColors.greyF8F8F8, thickness: 1, space: 24);
}
