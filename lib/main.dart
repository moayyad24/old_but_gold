import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:old_but_gold/features/auth/ui/login_screen.dart';

import 'i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.setLocale(AppLocale.en);
  runApp(TranslationProvider(child: const OldButGold()));
}

class OldButGold extends StatelessWidget {
  const OldButGold({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OBG',
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: [...GlobalMaterialLocalizations.delegates],
      theme: ThemeData(
        fontFamily: 'Manrope',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginScreen(),
    );
  }
}
