import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/widgets/app_content_area.dart';
import 'package:old_but_gold/features/profile/ui/widgets/profile/profile_body.dart';
import 'package:old_but_gold/features/profile/ui/widgets/profile/profile_button.dart';

class BuyersProfileBody extends StatelessWidget {
  const BuyersProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        AppContentArea(
          topPadding: 50,
          boxShadow: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AboutSection(),
              48.verticalSpace,
              ReviewsSection(),
              48.verticalSpace,
              ItemListings(),
            ],
          ),
        ),
        BuyersProfileButtonsRow(),
      ],
    );
  }
}

class BuyersProfileButtonsRow extends StatelessWidget {
  const BuyersProfileButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfileButton(
            title: 'Add Friend',
            iconPath: 'assets/icons/friends_filled.svg',
            backgroundColor: Color(0xFFFFF4DB),
            onPressed: () {},
          ),
          7.horizontalSpace,
          ProfileButton(
            title: 'Contact',
            iconPath: 'assets/icons/inbox.svg',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
