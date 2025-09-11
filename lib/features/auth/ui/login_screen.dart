import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/helper/input_validator.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/app_snack_bar.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/auth/manager/login_cubit/login_cubit.dart';
import 'package:old_but_gold/features/auth/manager/login_cubit/login_state.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';
import 'package:old_but_gold/core/widgets/app_text_field.dart';
import 'package:old_but_gold/core/widgets/content_area.dart';
import 'package:old_but_gold/core/widgets/custom_stepper.dart';
import 'package:old_but_gold/features/auth/ui/widgets/forget_password_text.dart';
import 'package:old_but_gold/features/auth/ui/widgets/google_auth_button.dart';
import 'package:old_but_gold/features/auth/ui/widgets/or_divider.dart';
import 'package:old_but_gold/features/auth/ui/widgets/remember_me_checkbox.dart';
import 'package:old_but_gold/features/auth/ui/widgets/sign_up_prompt.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formkey;
  late bool isApplyToPrivacyPolicy;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formkey = GlobalKey();
    isApplyToPrivacyPolicy = false;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppBar(
            dots: [DotState.completed, DotState.current, DotState.next],
          ),
          ContentArea(
            child: Form(
              key: formkey,
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
                    prefixIconPath: 'assets/icons/user_icon.svg',
                    myController: emailController,
                    checkValid: (v) {
                      return InputValidator.validateEmail(v!);
                    },
                  ),
                  SizedBox(height: 20.h),
                  AppTextField(
                    fieldTitle: t.auth.password,
                    hintText: t.auth.enterYourPassword,
                    prefixIconPath: 'assets/icons/lock.svg',
                    myController: passwordController,
                    isObscure: true,
                    checkValid: (v) {
                      return InputValidator.validatePassword(v!);
                    },
                  ),
                  SizedBox(height: 14.h),
                  RememberMeCheckbox(
                    onChanged: (v) {
                      setState(() {
                        isApplyToPrivacyPolicy = v;
                      });
                    },
                  ),
                  SizedBox(height: 30.h),
                  LoginConfirmButton(
                    formkey: formkey,
                    email: emailController,
                    password: passwordController,
                    isApplyToPrivacyPolicy: isApplyToPrivacyPolicy,
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
          ),
        ],
      ),
    );
  }
}

class LoginConfirmButton extends StatelessWidget {
  const LoginConfirmButton({
    super.key,
    required this.formkey,
    required this.email,
    required this.password,
    required this.isApplyToPrivacyPolicy,
  });

  final GlobalKey<FormState> formkey;
  final TextEditingController email;
  final TextEditingController password;
  final bool isApplyToPrivacyPolicy;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          AppSnackBar.showError(context, message: state.errorMessage);
        } else if (state is LoginSuccess) {
          Navigator.of(context).pushNamed(Routes.mainScreen);
        }
      },
      builder: (context, state) {
        return AppConfirmButton(
          text: t.auth.login,
          onPressed: () async {
            if (formkey.currentState!.validate()) {
              if (isApplyToPrivacyPolicy) {
                FormData data = FormData.fromMap({
                  'email': email.text,
                  'password': password.text,
                });
                await BlocProvider.of<LoginCubit>(context).login(data);
              } else {
                AppSnackBar.showError(
                  context,
                  message:
                      t.auth.pleaseAcceptOurPrivacyTermsAndPoliciesToContinue,
                );
              }
            }
          },
          isLoading: (state is LoginLoading) ? true : false,
        );
      },
    );
  }
}
