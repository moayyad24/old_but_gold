import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/app_content_area.dart';
import 'package:old_but_gold/core/widgets/content_area.dart';
import 'package:old_but_gold/core/widgets/custom_stepper.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/create_post/ui/widgets/create_post_app_bar.dart';
import 'package:old_but_gold/features/create_post/ui/widgets/description_card.dart';
import 'package:old_but_gold/features/create_post/ui/widgets/post_bottom_navbar.dart';
import 'package:old_but_gold/core/widgets/product_images.dart';
import 'package:old_but_gold/features/create_post/ui/widgets/product_name_card.dart';
import 'package:old_but_gold/features/create_post/ui/widgets/user_picture_name_card.dart';

class PreviewPostScreen extends StatelessWidget {
  const PreviewPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PostBottomNavBar(
        onPressed: () {},
        iconLabel: 'Publish',
        leading: Container(
          height: 44.h,
          width: 112.w,
          margin: EdgeInsets.symmetric(horizontal: 26).r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFB0E1E3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '125.5 \$',
            style: AppTextStyles.bold22.copyWith(color: Color(0xFF006A6F)),
          ),
        ),
      ),
      body: Column(
        children: [
          CreatePostAppBar(
            dots: [DotState.completed, DotState.completed, DotState.current],
          ),
          Expanded(
            child: ContentArea(
              applyPadding: false,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: 730.h,
                    child: Column(
                      children: [
                        10.verticalSpace,
                        DragHandle(),
                        20.verticalSpace,
                        Text('Preview', style: AppTextStyles.bold26),
                        20.verticalSpace,
                        ProductImages(),
                      ],
                    ),
                  ),
                  AppContentArea(
                    topPadding: 20,
                    child: Column(
                      children: [
                        ProductNameCard(),
                        20.verticalSpace,
                        DescriptionCard(),
                        20.verticalSpace,
                        UserPictureNameCard(),
                      ],
                    ),
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
