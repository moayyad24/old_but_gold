import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_button.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_field.dart';
import 'package:old_but_gold/features/auth/ui/widgets/content_area.dart';
import 'package:old_but_gold/features/auth/ui/widgets/custom_stepper.dart';
import 'package:old_but_gold/features/auth/ui/widgets/google_auth_button.dart';
import 'package:old_but_gold/features/auth/ui/widgets/or_divider.dart';
import 'package:old_but_gold/features/auth/ui/widgets/remember_me_checkbox.dart';
import 'package:old_but_gold/features/auth/ui/widgets/sign_up_prompt.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                Text(
                  t.auth.sign_up,
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 36.h),
                AuthField(
                  fieldTitle: t.auth.email,
                  hintText: t.auth.email_example,
                  iconPath: 'assets/icons/user_icon.svg',
                  myController: TextEditingController(),
                  checkValid: (p0) {
                    return '';
                  },
                ),
                SizedBox(height: 20.h),
                AuthField(
                  fieldTitle: t.auth.password,
                  hintText: t.auth.enter_your_password,
                  iconPath: 'assets/icons/lock.svg',
                  myController: TextEditingController(),
                  isObscure: true,
                  checkValid: (p0) {
                    return '';
                  },
                ),
                SizedBox(height: 20.h),
                AuthField(
                  fieldTitle: t.auth.confirm_password,
                  hintText: t.auth.repeat_password,
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
                AuthButton(
                  text: t.auth.sign_up,
                  onPressed: () {
                    // Handle login logic
                  },
                  isLoading: false,
                ),
                SizedBox(height: 24.h),
                OrDivider(),
                SizedBox(height: 24.h),
                GoogleAuthButton(
                  onPressed: () {
                    LocaleSettings.setLocale(AppLocale.ar);
                    // Handle Google sign in
                  },
                  isLoading: false,
                ),
                SizedBox(height: 24.h),
                SignUpPrompt(
                  firstWord: t.auth.already_have_account,
                  secondWord: t.auth.login,
                  onSignUpPressed: () {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(Routes.homeScreen);
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
