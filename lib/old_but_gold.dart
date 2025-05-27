import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/features/auth/ui/sign_up_screen.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class OldButGold extends StatelessWidget {
  const OldButGold({super.key});

  @override
  Widget build(BuildContext context) {
    Locale appLocale = TranslationProvider.of(context).flutterLocale;
    AppLocale currentLocale = TranslationProvider.of(context).locale;
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'OBG',
        locale: appLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: [...GlobalMaterialLocalizations.delegates],
        theme: ThemeData(
          fontFamily: currentLocale == AppLocale.en ? 'Manrope' : 'Tajawal',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: SignUpScreen(),
      ),
    );
  }
}
