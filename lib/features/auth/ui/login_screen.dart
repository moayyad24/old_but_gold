import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';
import 'package:old_but_gold/core/widgets/app_text_field.dart';
import 'package:old_but_gold/core/widgets/content_area.dart';
import 'package:old_but_gold/features/auth/ui/widgets/custom_stepper.dart';
import 'package:old_but_gold/features/auth/ui/widgets/forget_password_text.dart';
import 'package:old_but_gold/features/auth/ui/widgets/google_auth_button.dart';
import 'package:old_but_gold/features/auth/ui/widgets/or_divider.dart';
import 'package:old_but_gold/features/auth/ui/widgets/remember_me_checkbox.dart';
import 'package:old_but_gold/features/auth/ui/widgets/sign_up_prompt.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppBar(
            dots: [DotState.completed, DotState.current, DotState.next],
          ),
          ContentArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                DragHandle(),
                SizedBox(height: 20.h),
                Text(t.auth.login, style: AppTextStyles.bold26),
                SizedBox(height: 36.h),
                AppTextField(
                  fieldTitle: t.auth.email,
                  hintText: t.auth.emailExample,
                  iconPath: 'assets/icons/user_icon.svg',
                  myController: TextEditingController(),
                  checkValid: (p0) {
                    return '';
                  },
                ),
                SizedBox(height: 20.h),
                AppTextField(
                  fieldTitle: t.auth.password,
                  hintText: t.auth.enterYourPassword,
                  iconPath: 'assets/icons/lock.svg',
                  myController: TextEditingController(),
                  isObscure: true,
                  checkValid: (p0) {
                    return '';
                  },
                ),
                SizedBox(height: 14.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: RememberMeCheckbox(),
                ),
                SizedBox(height: 30.h),
                AppConfirmButton(
                  text: t.auth.login,
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushNamed(Routes.personalInformationScreen);
                  },
                  isLoading: false,
                ),
                SizedBox(height: 24.h),
                ForgotPasswordText(
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushNamed(Routes.forgetPasswordScreen);
                  },
                ),
                SizedBox(height: 24.h),
                OrDivider(),
                SizedBox(height: 24.h),
                GoogleAuthButton(
                  onPressed: () {
                    // Handle Google sign in
                  },
                  isLoading: false,
                ),
                SizedBox(height: 24.h),
                SignUpPrompt(
                  firstWord: t.auth.doNotHaveAnAccount,
                  secondWord: t.auth.signUp,
                  onSignUpPressed: () {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(Routes.signUpScreen);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
