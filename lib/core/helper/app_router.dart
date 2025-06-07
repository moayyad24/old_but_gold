import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/features/auth/data/repos/auth_repo_impl.dart';
import 'package:old_but_gold/features/auth/manager/register_cubit/register_cubit.dart';
import 'package:old_but_gold/features/auth/ui/forget_password_screen.dart';
import 'package:old_but_gold/features/auth/ui/login_screen.dart';
import 'package:old_but_gold/features/auth/ui/sign_up_screen.dart';
import 'package:old_but_gold/features/auth/ui/verify_code_screen.dart';
import 'package:old_but_gold/features/onboarding/ui/onboarding_screen.dart';
import 'package:old_but_gold/features/settings/ui/personal_information_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //OnBoarding
      case Routes.onboardingScreen:
        return _buildOnboardingScreen();
      //Auth
      case Routes.loginScreen:
        return _buildLoginScreen();
      case Routes.signUpScreen:
        return _buildSignUpScreen();
      case Routes.forgetPasswordScreen:
        return _buildForgetPasswordScreen();
      case Routes.verifyCodeScreen:
        return _buildVerifyCodeScreen();
      //Settings
      case Routes.personalInformationScreen:
        return _buildPersonalInformationScreen();
      default:
        return null;
    }
  }

  Route _buildOnboardingScreen() {
    return MaterialPageRoute(builder: (_) => const OnboardingScreen());
  }

  Route _buildLoginScreen() {
    return MaterialPageRoute(builder: (_) => const LoginScreen());
  }

  Route _buildSignUpScreen() {
    return MaterialPageRoute(
      builder:
          (_) => BlocProvider(
            create: (context) => RegisterCubit(getIt.get<AuthRepoImpl>()),
            child: const SignUpScreen(),
          ),
    );
  }

  Route _buildForgetPasswordScreen() {
    return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
  }

  Route _buildVerifyCodeScreen() {
    return MaterialPageRoute(builder: (_) => const VerifyCodeScreen());
  }

  Route _buildPersonalInformationScreen() {
    return MaterialPageRoute(builder: (_) => const PersonalInformationScreen());
  }
}
