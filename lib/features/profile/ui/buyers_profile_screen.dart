import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';
import 'package:old_but_gold/core/widgets/app_bar_button.dart';
import 'package:old_but_gold/core/widgets/top_gradient_container.dart';
import 'package:old_but_gold/features/profile/ui/widgets/profile/buyers_profile_body.dart';
import 'package:old_but_gold/features/profile/ui/widgets/profile/profile_picture_and_name.dart';

class BuyersProfileScreen extends StatelessWidget {
  const BuyersProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TopGradientContainer(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: UiParameters.dPadding,
                child: Column(
                  children: [
                    Row(
                      children: [
                        AppBarButton(),
                        14.horizontalSpace,
                        Text('Buyer’s Profile', style: AppTextStyles.bold28),
                      ],
                    ),
                    37.verticalSpace,
                    ProfilePictureAndName(),
                    37.verticalSpace,
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) => BuyersProfileBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
