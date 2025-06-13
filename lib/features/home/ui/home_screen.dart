import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/features/home/ui/widgets/home_top_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HomeSliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) => Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteFFFDF2,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(34),
                      ),
                      border: Border.all(color: AppColors.greyC2C2C2),
                    ),
                    margin: EdgeInsets.only(top: 25),
                    padding: EdgeInsets.only(left: 24, right: 24).r,
                    child: SizedBox(width: double.infinity, height: 1000),
                  ),
                  Positioned(
                    top: 0,
                    width: 345,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 14,
                            top: 10,
                            bottom: 10,
                            end: 5,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/search_icon.svg',
                          ),
                        ),
                        isDense: true,
                        hintText: 'Search for anything...',
                        hintStyle: TextStyle(
                          color: AppColors.darkGrey666666,
                          fontSize: 16.sp,
                        ),
                        fillColor: AppColors.whiteFFFFFF,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: AppColors.greyC2C2C2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: AppColors.greyC2C2C2,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: AppColors.blue2E8DFA,
                            width: 1.5,
                          ),
                        ),
                      ),
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

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 280,
      flexibleSpace: FlexibleSpaceBar(background: HomeTopSection()),
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20.0, top: 10),
        child: Row(
          children: [
            Icon(Icons.location_on),
            8.horizontalSpace,
            Text('Homs, Syria', style: AppTextStyles.medium16),
          ],
        ),
      ),
      leadingWidth: 200,
    );
  }
}
