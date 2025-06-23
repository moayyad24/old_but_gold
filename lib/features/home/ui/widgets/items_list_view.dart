import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/features/home/ui/widgets/image_card.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 221.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        padding: EdgeInsets.symmetric(horizontal: 24),
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
