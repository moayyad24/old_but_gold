import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/helper/app_router.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/navigation_service.dart';
import 'package:old_but_gold/core/helper/route_manager.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_theme.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class OldButGold extends StatelessWidget {
  final AppRouter appRouter;
  const OldButGold({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    Locale appLocale = TranslationProvider.of(context).flutterLocale;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.whiteFFFDF2,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'OBG',
        locale: appLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: [...GlobalMaterialLocalizations.delegates],
        theme: AppTheme().defaultTheme,
        navigatorKey: getIt.get<NavigationService>().navigatorKey,
        initialRoute:
            isLoggedInUser ? Routes.mainScreen : Routes.onboardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
