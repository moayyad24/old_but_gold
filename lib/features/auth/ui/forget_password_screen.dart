import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/input_validator.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/app_snack_bar.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/auth/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:old_but_gold/features/auth/manager/forget_password_cubit/forget_password_state.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';
import 'package:old_but_gold/core/widgets/app_text_field.dart';
import 'package:old_but_gold/core/widgets/content_area.dart';
import 'package:old_but_gold/features/auth/ui/widgets/terms_and_privacy_text.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late TextEditingController emailController;
  late GlobalKey<FormState> formkey;
  @override
  void initState() {
    emailController = TextEditingController();

    formkey = GlobalKey();

    super.initState();
  }

  Future<void> storeUserEmail(String email) async {
    final LocalStorageService storage = getIt<LocalStorageService>();
    await storage.setString('user_email', email);
  }

  @override
  void dispose() {
    emailController.dispose();
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
                children: [
                  DragHandle(),
                  SizedBox(height: 20.h),
                  Text(t.auth.forgetPassword, style: AppTextStyles.bold26),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 42.w),
                    child: Text(
                      t.auth.itsOk,
                      style: AppTextStyles.medium15,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  AppTextField(
                    fieldTitle: t.auth.email,
                    hintText: t.auth.emailExample,
                    prefixIconPath: 'assets/icons/user_icon.svg',
                    myController: emailController,
                    checkValid: (v) {
                      return InputValidator.validateEmail(v!);
                    },
                  ),
                  SizedBox(height: 13.h),
                  SizedBox(height: 34.h),
                  Text(
                    t.auth.weMayUseYourEmailAddress,
                    style: AppTextStyles.medium14.copyWith(
                      color: AppColors.grey666666,
                    ),
                  ),
                  SizedBox(height: 23.h),
                  TermsAndPrivacyText(),
                  SizedBox(height: 53.h),
                  BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                    listener: (context, state) async {
                      if (state is ForgetPasswordFailure) {
                        AppSnackBar.showError(
                          context,
                          message: state.errorMessage,
                        );
                      } else if (state is ForgetPasswordSuccess) {
                        await Future.wait([
                          storeUserEmail(emailController.text),
                          Navigator.of(
                            context,
                          ).pushNamed(Routes.checkCodeScreen),
                        ]);
                      }
                    },
                    builder: (context, state) {
                      return AppConfirmButton(
                        text: t.auth.recoverPassword,
                        isLoading: (state is ForgetPasswordLoading),
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<ForgetPasswordCubit>(
                              context,
                            ).checkEmail(emailController.text);
                          }
                        },
                      );
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
