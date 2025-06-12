import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteFFFDF2,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.5.sh,
            width: 1.sw,
            child: Image.asset(
              'assets/images/onboarding.png',
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Spacer(),
          Padding(
            padding: UiParameters.hPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('OBG - Old But Gold', style: AppTextStyles.bold28),

                Text(
                  'Find the best deals in the market, good value with the lowest prices ever',
                  style: AppTextStyles.medium20,
                ),
              ],
            ),
          ),
          Spacer(flex: 2),
          Padding(
            padding: UiParameters.hPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppConfirmButton(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.introductionScreen);
                  },
                ),
                12.verticalSpace,
                AppConfirmButton(
                  text: 'Login',
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.loginScreen);
                  },
                  border: true,
                  backgroundColor: AppColors.whiteFBFBFB,
                ),
              ],
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
