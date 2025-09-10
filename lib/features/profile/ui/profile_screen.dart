import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';
import 'package:old_but_gold/features/profile/ui/widgets/profile/profile_body.dart';
import 'package:old_but_gold/features/profile/ui/widgets/profile/profile_picture_and_name.dart';
import 'package:old_but_gold/features/profile/ui/widgets/profile/profile_top_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: AlignmentGeometry.xy(0, 0),
          stops: [0, 0.04, .3],
          colors: [Color(0xFFFFDC91), Color(0xFFFFDC90), Color(0xFFFFFFFF)],
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: UiParameters.dPadding,
              child: Column(
                children: [
                  ProfileTopBar(),
                  30.verticalSpace,
                  ProfilePictureAndName(),
                  40.verticalSpace,
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) => Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [ProfileBody()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
