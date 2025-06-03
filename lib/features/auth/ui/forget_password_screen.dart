import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';
import 'package:old_but_gold/core/widgets/app_text_field.dart';
import 'package:old_but_gold/core/widgets/content_area.dart';
import 'package:old_but_gold/features/auth/ui/widgets/terms_and_privacy_text.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
                Text(
                  t.auth.forget_password,
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 42.w),
                  child: Text(
                    t.auth.its_ok,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 32.h),
                AppTextField(
                  fieldTitle: t.auth.email,
                  hintText: t.auth.email_example,
                  iconPath: 'assets/icons/user_icon.svg',
                  myController: TextEditingController(),
                  checkValid: (_) {
                    return null;
                  },
                ),
                SizedBox(height: 13.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    t.auth.use_phone_instead,
                    style: TextStyle(
                      fontSize: 13.sp,
                      decoration: TextDecoration.underline,
                      color: AppColors.blue2E8DFA,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                Text(
                  t.auth.we_may_use_your_email_address,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.grey666666,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 23.h),
                TermsAndPrivacyText(),
                SizedBox(height: 53.h),
                AppConfirmButton(
                  text: t.auth.recover_password,
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.verifyCodeScreen);
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
