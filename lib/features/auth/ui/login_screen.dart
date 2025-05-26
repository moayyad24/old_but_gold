import 'package:flutter/material.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_button.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_field.dart';
import 'package:old_but_gold/features/auth/ui/widgets/content_area.dart';
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
            stepper: CustomStepper(
              dots: [DotState.completed, DotState.current, DotState.next],
            ),
          ),
          ContentArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                DragHandle(),
                SizedBox(height: 20),
                Text(
                  t.auth.login,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 36),
                AuthField(
                  fieldTitle: t.auth.email,
                  hintText: t.auth.email_example,
                  iconPath: 'assets/icons/user_icon.svg',
                  myController: TextEditingController(),
                  checkValid: (p0) {
                    return '';
                  },
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 14),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: RememberMeCheckbox(),
                ),
                const SizedBox(height: 30),
                AuthButton(
                  text: t.auth.login,
                  onPressed: () {
                    // Handle login logic
                  },
                  isLoading: false,
                ),
                const SizedBox(height: 24),
                ForgotPasswordText(
                  onTap: () {
                    // Handle forgotten password flow
                  },
                ),
                const SizedBox(height: 24),
                OrDivider(),
                const SizedBox(height: 24),
                GoogleAuthButton(
                  onPressed: () {
                    LocaleSettings.setLocale(AppLocale.ar);
                    // Handle Google sign in
                  },
                  isLoading: false,
                ),
                const SizedBox(height: 24),
                SignUpPrompt(
                  onSignUpPressed: () {
                    // Navigate to sign up screen
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
