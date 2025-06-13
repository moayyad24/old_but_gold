import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';
import 'package:old_but_gold/features/onboarding/ui/widgets/sliding_column_grid.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteFFFDF2,
      body: Stack(
        children: [
          SlidingColumnGrid(
            icons: [
              Icons.star,
              Icons.favorite,
              Icons.home,
              Icons.settings,
              Icons.person,
              Icons.work,
              Icons.email,
              Icons.notifications,
              Icons.music_note,
            ],
            columns: 1.sw > 384 ? 5 : 4,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 0.5.sh,
              decoration: BoxDecoration(
                color: AppColors.whiteFFFDF2,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(34),
                ),
                border: Border.all(
                  color: AppColors.darkGrey666666.withAlpha(100),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkGrey666666.withAlpha(100),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, -1),
                  ),
                ],
              ),
              padding: EdgeInsets.only(top: 28, left: 24, right: 24).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('OBG - Old But Gold', style: AppTextStyles.bold28),
                  25.verticalSpace,
                  Text(
                    'Find the best deals in the market, good value with the lowest prices ever',
                    style: AppTextStyles.medium20,
                  ),
                  Spacer(flex: 2),
                  AppConfirmButton(
                    text: 'Get Started',
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.introductionScreen);
                    },
                  ),
                  16.verticalSpace,
                  AppConfirmButton(
                    text: 'Login',
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.loginScreen);
                    },
                    border: true,
                    backgroundColor: AppColors.whiteFBFBFB,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
