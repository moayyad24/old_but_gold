import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/constants/db_keys.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/app_snack_bar.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/auth/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:old_but_gold/features/auth/manager/forget_password_cubit/forget_password_state.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';
import 'package:old_but_gold/core/widgets/content_area.dart';
import 'package:old_but_gold/features/auth/ui/widgets/otp_field.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class CheckCodeScreen extends StatefulWidget {
  const CheckCodeScreen({super.key});

  @override
  State<CheckCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<CheckCodeScreen> {
  late String code, email;
  late LocalStorageService storage;
  @override
  void initState() {
    storage = getIt<LocalStorageService>();
    email = storage.getString(DbKeys.userEmail)!;
    super.initState();
  }

  Future<void> storeVerificationCode(String code) async {
    final LocalStorageService storage = getIt<LocalStorageService>();
    await storage.setString('code', code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppBar(),
          ContentArea(
            child: Column(
              children: [
                DragHandle(),
                SizedBox(height: 20.h),
                Text('Check Code', style: AppTextStyles.bold26),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  child: Text(
                    t.auth.fourDigitCode,
                    style: AppTextStyles.medium15,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 32.h),
                OtpField(
                  onCompleted: (value) {
                    setState(() {
                      code = value;
                    });
                  },
                ),
                SizedBox(height: 32.h),

                Text(
                  t.auth.weMayUseYourEmailAddress,
                  style: AppTextStyles.medium14.copyWith(
                    color: AppColors.grey666666,
                  ),
                ),
                SizedBox(height: 36.h),
                BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                  listener: (context, state) async {
                    if (state is ForgetPasswordFailure) {
                      AppSnackBar.showError(
                        context,
                        message: state.errorMessage,
                      );
                    } else if (state is ForgetPasswordSuccess) {
                      await Future.wait([
                        storeVerificationCode(code),
                        Navigator.pushNamed(
                          context,
                          Routes.setNewPasswordScreen,
                        ),
                      ]);
                    }
                  },
                  builder:
                      (context, state) => AppConfirmButton(
                        text: t.auth.verify,
                        isLoading: (state is ForgetPasswordLoading),
                        onPressed: () async {
                          FormData data = FormData.fromMap({
                            'code': code,
                            'email': email,
                          });
                          BlocProvider.of<ForgetPasswordCubit>(
                            context,
                          ).checkCode(data);
                        },
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
