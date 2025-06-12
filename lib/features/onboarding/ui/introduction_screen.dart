import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/features/onboarding/data/model/introduction_model.dart';
import 'package:old_but_gold/features/onboarding/manager/introduction_cubit/introduction_cubit.dart';
import 'package:old_but_gold/features/onboarding/manager/introduction_cubit/introduction_state.dart';
import 'package:old_but_gold/features/onboarding/ui/widgets/dots_indicator.dart';
import 'package:old_but_gold/features/onboarding/ui/widgets/get_started_button.dart';
import 'package:old_but_gold/features/onboarding/ui/widgets/intro_app_bar.dart';
import 'package:old_but_gold/features/onboarding/ui/widgets/intro_page_view_column.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntroductionCubit(),
      child: Scaffold(
        body: BlocBuilder<IntroductionCubit, IntroductionState>(
          builder: (context, state) {
            final cubit = context.read<IntroductionCubit>();
            return Column(
              children: [
                const IntroAppBar(),
                47.verticalSpace,
                Expanded(
                  child: PageView.builder(
                    controller: cubit.pageController,
                    onPageChanged: (i) {
                      cubit.updatePageIndex(i);
                    },
                    itemCount: introList.length,
                    itemBuilder: (context, index) {
                      return IntroPageViewColumn(
                        image: introList[index].image,
                        title: introList[index].title,
                        subTitle: introList[index].subTitle,
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: DotsIndicator(
                        dotsCount: 3,
                        currentDot: state.currentIndex,
                        activeColor: AppColors.green006A6F,
                        inactiveColor: AppColors.greyB7B7B7,
                        dotSize: 12.0,
                        activeDotWidth: 42.0,
                      ),
                    ),
                    GetStartedButton(onPressed: cubit.nextPage),
                  ],
                ),
                47.verticalSpace,
              ],
            );
          },
        ),
      ),
    );
  }
}
