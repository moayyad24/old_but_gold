import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: Image.asset('assets/images/home_shop.png', width: 0.6.sw),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: UiParameters.dPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                60.verticalSpace,
                Text('Old But Gold', style: AppTextStyles.bold26),
                24.verticalSpace,
                SizedBox(
                  width: 114.w,
                  child: Text(
                    'Find the best deals in the market \$',
                    style: AppTextStyles.medium16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
