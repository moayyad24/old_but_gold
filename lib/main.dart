import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/helper/app_router.dart';
import 'package:old_but_gold/old_but_gold.dart';
import 'i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.setLocale(AppLocale.en);
  await ScreenUtil.ensureScreenSize();
  runApp(
    TranslationProvider(
      child: DevicePreview(
        enabled: false,
        builder: (context) => OldButGold(appRouter: AppRouter()),
      ),
    ),
  );
}
