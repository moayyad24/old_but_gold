import 'package:flutter/material.dart';
import 'package:old_but_gold/core/constants/routes.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> logoutToLogin() async {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      Routes.loginScreen,
      (route) => false,
    );
  }
}
