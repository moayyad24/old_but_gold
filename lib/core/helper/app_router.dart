import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/features/auth/data/repos/auth/auth_repo_impl.dart';
import 'package:old_but_gold/features/auth/data/repos/forget_password/forget_password_repo_impl.dart';
import 'package:old_but_gold/features/auth/manager/login_cubit/login_cubit.dart';
import 'package:old_but_gold/features/auth/manager/register_cubit/register_cubit.dart';
import 'package:old_but_gold/features/auth/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:old_but_gold/features/auth/manager/verify_email_cubit/verify_email_cubit.dart';
import 'package:old_but_gold/features/auth/ui/check_code_screen.dart';
import 'package:old_but_gold/features/auth/ui/forget_password_screen.dart';
import 'package:old_but_gold/features/auth/ui/login_screen.dart';
import 'package:old_but_gold/features/auth/ui/set_new_password_screen.dart';
import 'package:old_but_gold/features/auth/ui/sign_up_screen.dart';
import 'package:old_but_gold/features/auth/ui/verify_code_screen.dart';
import 'package:old_but_gold/features/create_post/ui/categories_screen.dart';
import 'package:old_but_gold/features/create_post/ui/create_post_screen.dart';
import 'package:old_but_gold/features/create_post/ui/preview_post_screen.dart';
import 'package:old_but_gold/features/item_preview/ui/item_preview_screen.dart';
import 'package:old_but_gold/features/onboarding/ui/introduction_screen.dart';
import 'package:old_but_gold/features/onboarding/ui/onboarding_screen.dart';
import 'package:old_but_gold/features/profile/data/repos/profile_repo_impl.dart';
import 'package:old_but_gold/features/profile/manager/profile_information_cubit/profile_information_cubit.dart';
import 'package:old_but_gold/features/profile/ui/personal_information_screen.dart';
import 'package:old_but_gold/main_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //OnBoarding
      case Routes.onboardingScreen:
        return _buildOnboardingScreen();
      case Routes.introductionScreen:
        return _buildIntroductionScreen();
      //Auth
      case Routes.loginScreen:
        return _buildLoginScreen();
      case Routes.signUpScreen:
        return _buildSignUpScreen();
      case Routes.forgetPasswordScreen:
        return _buildForgetPasswordScreen();
      case Routes.setNewPasswordScreen:
        return _buildSetNewPasswordScreen();
      case Routes.verifyCodeScreen:
        return _buildVerifyCodeScreen();
      case Routes.checkCodeScreen:
        return _buildCheckCodeScreen();
      //Home
      case Routes.mainScreen:
        return _buildMainScreen();
      //Create Post
      case Routes.createPostScreen:
        return _buildCreatePostScreen();
      case Routes.categoryScreen:
        return _buildCategoryScreen();
      case Routes.previewPostScreen:
        return _buildPreviewPostScreen();
      //Settings
      case Routes.personalInformationScreen:
        return _buildPersonalInformationScreen();
      //Item Preview
      case Routes.itemPreviewScreen:
        return _buildItePreviewScreen();
      default:
        return null;
    }
  }

  Route _buildOnboardingScreen() {
    return MaterialPageRoute(builder: (_) => const OnboardingScreen());
  }

  Route _buildIntroductionScreen() {
    return MaterialPageRoute(builder: (_) => const IntroductionScreen());
  }

  Route _buildLoginScreen() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
        child: const LoginScreen(),
      ),
    );
  }

  Route _buildSignUpScreen() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => RegisterCubit(getIt.get<AuthRepoImpl>()),
        child: const SignUpScreen(),
      ),
    );
  }

  Route _buildForgetPasswordScreen() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) =>
            ForgetPasswordCubit(getIt.get<ForgetPasswordRepoImpl>()),
        child: const ForgetPasswordScreen(),
      ),
    );
  }

  Route _buildSetNewPasswordScreen() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) =>
            ForgetPasswordCubit(getIt.get<ForgetPasswordRepoImpl>()),
        child: const SetNewPasswordScreen(),
      ),
    );
  }

  Route _buildVerifyCodeScreen() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => VerifyEmailCubit(getIt.get<AuthRepoImpl>()),
        child: const VerifyCodeScreen(),
      ),
    );
  }

  Route _buildCheckCodeScreen() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) =>
            ForgetPasswordCubit(getIt.get<ForgetPasswordRepoImpl>()),
        child: const CheckCodeScreen(),
      ),
    );
  }

  Route _buildMainScreen() {
    return MaterialPageRoute(builder: (_) => const MainScreen());
  }

  Route _buildCreatePostScreen() {
    return MaterialPageRoute(builder: (_) => const CreatePostScreen());
  }

  Route _buildCategoryScreen() {
    return MaterialPageRoute(builder: (_) => const CategoriesScreen());
  }

  Route _buildPreviewPostScreen() {
    return MaterialPageRoute(builder: (_) => const PreviewPostScreen());
  }

  Route _buildPersonalInformationScreen() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) =>
            ProfileInformationCubit(getIt.get<ProfileRepoImpl>()),
        child: const PersonalInformationScreen(),
      ),
    );
  }

  Route _buildItePreviewScreen() {
    return MaterialPageRoute(builder: (_) => const ItemPreviewScreen());
  }
}
