import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/helper/app_router.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/route_manager.dart';
import 'package:old_but_gold/core/helper/simple_bloc_observer.dart';
import 'package:old_but_gold/old_but_gold.dart';
import 'i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  LocaleSettings.setLocale(AppLocale.en);
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
  await RouteManager.getInitialRoute();
  runApp(
    TranslationProvider(
      child: DevicePreview(
        enabled: true,
        builder: (context) => OldButGold(appRouter: AppRouter()),
      ),
    ),
  );
}
