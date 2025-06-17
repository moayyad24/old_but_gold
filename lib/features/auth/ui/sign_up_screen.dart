import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/helper/input_validator.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/auth/manager/register_cubit/register_cubit.dart';
import 'package:old_but_gold/features/auth/manager/register_cubit/register_state.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';
import 'package:old_but_gold/core/widgets/app_text_field.dart';
import 'package:old_but_gold/core/widgets/content_area.dart';
import 'package:old_but_gold/features/auth/ui/widgets/custom_stepper.dart';
import 'package:old_but_gold/features/auth/ui/widgets/google_auth_button.dart';
import 'package:old_but_gold/features/auth/ui/widgets/or_divider.dart';
import 'package:old_but_gold/features/auth/ui/widgets/remember_me_checkbox.dart';
import 'package:old_but_gold/features/auth/ui/widgets/sign_up_prompt.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late GlobalKey<FormState> formkey;
  late bool isApplyToPrivacyPolicy;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formkey = GlobalKey();
    isApplyToPrivacyPolicy = false;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                  const DragHandle(),
                  SizedBox(height: 20.h),
                  Text(t.auth.signUp, style: AppTextStyles.bold26),
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
                  SizedBox(height: 20.h),
                  AppTextField(
                    fieldTitle: t.auth.confirmPassword,
                    hintText: t.auth.repeatPassword,
                    prefixIconPath: 'assets/icons/lock.svg',
                    myController: confirmPasswordController,
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
                  SignUpConfirmButton(
                    formkey: formkey,
                    email: emailController,
                    password: passwordController,
                    confirmPassword: confirmPasswordController,
                    isApplyToPrivacyPolicy: isApplyToPrivacyPolicy,
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
                    firstWord: t.auth.alreadyHaveAccount,
                    secondWord: t.auth.login,
                    onSignUpPressed: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(Routes.loginScreen);
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

class SignUpConfirmButton extends StatelessWidget {
  const SignUpConfirmButton({
    super.key,
    required this.formkey,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.isApplyToPrivacyPolicy,
  });

  final GlobalKey<FormState> formkey;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final bool isApplyToPrivacyPolicy;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is RegisterSuccess) {
          BlocProvider.of<RegisterCubit>(context).storeUserEmail(email.text);
          Navigator.pushNamed(context, Routes.verifyCodeScreen);
        }
      },
      builder: (context, state) {
        return AppConfirmButton(
          text: t.auth.signUp,
          onPressed: () async {
            if (formkey.currentState!.validate()) {
              if (isApplyToPrivacyPolicy) {
                FormData data = FormData.fromMap({
                  'email': email.text,
                  'password': password.text,
                  'password_confirmation': confirmPassword.text,
                });
                await BlocProvider.of<RegisterCubit>(context).register(data);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      t.auth.pleaseAcceptOurPrivacyTermsAndPoliciesToContinue,
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }
          },
          isLoading: (state is RegisterLoading) ? true : false,
        );
      },
    );
  }
}
