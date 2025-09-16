import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 260,
      forceMaterialTransparency: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: 70).r,
          child: Image.asset('assets/images/test_carousal_image.png'),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20.0, top: 10),
        child: Text('Welcome !!', style: AppTextStyles.bold28),
      ),
      leadingWidth: 200,
      actions: [
        Row(
          children: [
            Text('oran', style: AppTextStyles.medium18),
            6.horizontalSpace,
            SvgPicture.asset('assets/icons/map_pin.svg'),
          ],
        ),
      ],
      actionsPadding: EdgeInsets.symmetric(horizontal: 20),
    );
  }
}
