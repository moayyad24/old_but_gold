import 'package:flutter/material.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/features/auth/ui/forget_password_screen.dart';
import 'package:old_but_gold/features/auth/ui/login_screen.dart';
import 'package:old_but_gold/features/auth/ui/sign_up_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return _buildLoginScreen();
      case Routes.signUpScreen:
        return _buildSignUpScreen();
      case Routes.forgetPasswordScreen:
        return _buildForgetPasswordScreen();
      default:
        return null;
    }
  }

  Route _buildLoginScreen() {
    return MaterialPageRoute(builder: (_) => const LoginScreen());
  }

  Route _buildSignUpScreen() {
    return MaterialPageRoute(builder: (_) => const SignUpScreen());
  }

  Route _buildForgetPasswordScreen() {
    return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
  }
}
