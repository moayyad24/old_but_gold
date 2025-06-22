import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/features/home/ui/widgets/image_card.dart';
class ItemsListViewWithBackgroundImage extends StatelessWidget {
  const ItemsListViewWithBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
      decoration: BoxDecoration(
        color: Color(0xFFffe5a9),
        image: DecorationImage(
          image: AssetImage('assets/images/lowest_prices_ever_image.png'),
          alignment: Alignment.centerLeft,
        ),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsetsDirectional.only(
          top: 24,
          bottom: 24,
          end: 24,
          start: 150,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return ImageCard(
            imagePath: 'assets/images/test_image.png',
            title: 'iPhone 15 Pro max',
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 16);
        },
      ),
    );
  }
}