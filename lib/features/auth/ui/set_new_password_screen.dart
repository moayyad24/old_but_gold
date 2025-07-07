import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/constants/db_keys.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/input_validator.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/auth/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:old_but_gold/features/auth/manager/forget_password_cubit/forget_password_state.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';
import 'package:old_but_gold/core/widgets/app_text_field.dart';
import 'package:old_but_gold/core/widgets/content_area.dart';
import 'package:old_but_gold/features/auth/ui/widgets/remember_me_checkbox.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late GlobalKey<FormState> formkey;
  late bool isApplyToPrivacyPolicy;
  late LocalStorageService storage;
  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formkey = GlobalKey();
    isApplyToPrivacyPolicy = false;
    storage = getIt<LocalStorageService>();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppBar(),
          ContentArea(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const DragHandle(),
                  SizedBox(height: 20.h),
                  Text('Reset Password', style: AppTextStyles.bold26),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42),
                    child: Text(
                      'Create a new password for your account',
                      style: AppTextStyles.medium15,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 32.h),
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
                  SetNewPasswordConfirmButton(
                    formkey: formkey,
                    email: storage.getString(DbKeys.userEmail)!,
                    code: storage.getString(DbKeys.verificationCode)!,
                    password: passwordController,
                    confirmPassword: confirmPasswordController,
                    isApplyToPrivacyPolicy: isApplyToPrivacyPolicy,
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

class SetNewPasswordConfirmButton extends StatelessWidget {
  const SetNewPasswordConfirmButton({
    super.key,
    required this.formkey,
    required this.email,
    required this.code,
    required this.password,
    required this.confirmPassword,
    required this.isApplyToPrivacyPolicy,
  });

  final GlobalKey<FormState> formkey;
  final String email;
  final String code;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final bool isApplyToPrivacyPolicy;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is ForgetPasswordSuccess) {
          Navigator.pushReplacementNamed(context, Routes.loginScreen);
        }
      },
      builder: (context, state) {
        return AppConfirmButton(
          text: 'Create New Password',
          onPressed: () async {
            !isApplyToPrivacyPolicy
                ? ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      t.auth.pleaseAcceptOurPrivacyTermsAndPoliciesToContinue,
                    ),
                    backgroundColor: Colors.red,
                  ),
                )
                : null;
            if (formkey.currentState!.validate() && isApplyToPrivacyPolicy) {
              FormData data = FormData.fromMap({
                'email': email,
                'password': password.text,
                'password_confirmation': confirmPassword.text,
                'code': code,
              });
              await BlocProvider.of<ForgetPasswordCubit>(
                context,
              ).changePassword(data);
            }
          },
          isLoading: (state is ForgetPasswordLoading),
        );
      },
    );
  }
}
