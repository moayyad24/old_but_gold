import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';
import 'package:old_but_gold/core/widgets/app_back_button.dart';
import 'package:old_but_gold/core/widgets/app_content_area.dart';
import 'package:old_but_gold/core/widgets/product_images.dart';
import 'package:old_but_gold/features/create_post/ui/widgets/description_card.dart';
import 'package:old_but_gold/features/create_post/ui/widgets/post_bottom_navbar.dart';
import 'package:old_but_gold/features/create_post/ui/widgets/product_name_card.dart';
import 'package:old_but_gold/features/create_post/ui/widgets/user_picture_name_card.dart';
import 'package:old_but_gold/features/home/ui/widgets/items_grid_view.dart';
import 'package:old_but_gold/features/home/ui/widgets/items_list_view.dart';
import 'package:old_but_gold/features/home/ui/widgets/list_title.dart';
import 'package:old_but_gold/features/profile/ui/widgets/profile/profile_body.dart';

class ItemPreviewScreen extends StatelessWidget {
  const ItemPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PostBottomNavBar(
        onPressed: () {},
        iconLabel: 'Send an Offer',
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(children: [ProductImages(), ItemPreviewAppBar()]),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 320.h),
                AppContentArea(
                  topPadding: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductNameCard(),
                      20.verticalSpace,
                      DescriptionCard(),
                      20.verticalSpace,
                      UserPictureNameCard(),
                      ReviewCard(),
                      ListTitle(title: 'More from the seller'),
                      ItemsListView(),
                      ListTitle(title: 'Similar Items'),
                      ItemsGridView(),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemPreviewAppBar extends StatelessWidget {
  const ItemPreviewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiParameters.dPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBackButton(),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/liked.svg'),
          ),
        ],
      ),
    );
  }
}
