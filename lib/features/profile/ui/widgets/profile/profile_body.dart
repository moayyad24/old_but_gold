import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';
import 'package:old_but_gold/core/widgets/app_content_area.dart';
import 'package:old_but_gold/features/profile/ui/widgets/profile/profile_button.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

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
              20.verticalSpace,
            ],
          ),
        ),
        ProfileButtonsRow(),
      ],
    );
  }
}

class ProfileButtonsRow extends StatelessWidget {
  const ProfileButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfileButton(
            title: 'Edit',
            iconPath: 'assets/icons/edit_solid.svg',
            onPressed: () {
              Navigator.pushNamed(context, Routes.personalInformationScreen);
            },
          ),
          7.horizontalSpace,
          ProfileButton(
            title: 'Preferences',
            iconPath: 'assets/icons/preferences.svg',
            backgroundColor: Color(0xFFFFF4DB),
            onPressed: () {
              Navigator.pushNamed(context, Routes.settingsScreen);
            },
          ),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiParameters.hPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("About me", style: AppTextStyles.bold18),
              Row(
                children: [
                  Text("Oran", style: AppTextStyles.medium15),
                  4.horizontalSpace,
                  SvgPicture.asset('assets/icons/map_pin.svg'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style.copyWith(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text:
                      "I’m Azeddine located in Oran, Algeria, I love to get efficient contact with my clients to sell good quality products... ",
                ),
                TextSpan(
                  text: "Read more",
                  style: const TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle click action
                      debugPrint("Read more clicked");
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

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: UiParameters.hPadding,
          child: Text("Reviews", style: AppTextStyles.bold22),
        ),
        14.verticalSpace,
        ReviewCard(),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: UiParameters.hPadding,
      decoration: BoxDecoration(
        color: AppColors.mainFFFCF6,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.greyB7B7B7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(60),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "“Ahmed was an outstanding driver! His car was spotless, outstanding driver! His car was spotless,”",
              style: AppTextStyles.medium16,
            ),
            12.verticalSpace,
            const Divider(color: AppColors.greyC2C2C2),
            8.verticalSpace,

            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/women/44.jpg", // replace with real image
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Lydia Siphron", style: AppTextStyles.bold16),
                      Text("Standard user", style: AppTextStyles.semiBold13),
                    ],
                  ),
                ),
                SvgPicture.asset('assets/icons/star_fill.svg'),
                4.horizontalSpace,
                Text("4.5", style: AppTextStyles.semiBold20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemListings extends StatelessWidget {
  const ItemListings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiParameters.hPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Item listings", style: AppTextStyles.bold22),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10, // total items
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 5,
              mainAxisExtent: 149,
            ),
            itemBuilder: (context, index) {
              return ItemCard(
                imagePath: 'assets/images/test_image.png',
                title: 'iPhone 15 Pro max',
              );
            },
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const ItemCard({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: AppColors.greyC2C2C2,
            offset: const Offset(-3, -2),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildFavIcon(),
          Spacer(),
          _buildPrice(),
          8.verticalSpace,
          _buildTitleOverlay(),
        ],
      ),
    );
  }

  Align _buildFavIcon() {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: 5, top: 5),
        child: Icon(Icons.favorite_rounded, size: 18),
      ),
    );
  }

  Align _buildPrice() {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        height: 30,
        width: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFB0E1E3),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(9.r),
            bottomStart: Radius.circular(9.r),
          ),
        ),
        child: Text(
          '125.5 \$',
          style: AppTextStyles.bold16.copyWith(color: Color(0xFF006A6F)),
        ),
      ),
    );
  }

  Widget _buildTitleOverlay() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 30.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(14.r),
            bottomRight: Radius.circular(14.r),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFD8D9DB), Color(0xFFADACAC), Color(0xFF414141)],
            stops: [0.0, 0.2, 0.96],
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.bold12.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
