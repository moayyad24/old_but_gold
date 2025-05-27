import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/features/auth/ui/login_screen.dart';

import 'i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.setLocale(AppLocale.ar);
  await ScreenUtil.ensureScreenSize();
  runApp(
    TranslationProvider(
      child: DevicePreview(
        enabled: true,
        builder: (context) => OldButGold(), // Wrap your app
      ),
    ),
  );
}

class OldButGold extends StatelessWidget {
  const OldButGold({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'OBG',
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: [...GlobalMaterialLocalizations.delegates],
        theme: ThemeData(
          fontFamily: 'Manrope',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: LoginScreen(),
      ),
    );
  }
}
