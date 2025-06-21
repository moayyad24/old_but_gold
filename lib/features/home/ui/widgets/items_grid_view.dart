import 'package:flutter/material.dart';
import 'package:old_but_gold/features/home/ui/widgets/image_card.dart';

class ItemsGridView extends StatelessWidget {
  const ItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 6,
        crossAxisSpacing: 18,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            top: index % 2 == 0 ? 0 : 15.0,
            bottom: index % 2 != 0 ? 0 : 15.0,
          ),
          child: ImageCard(
            imagePath: 'assets/images/test_image.png',
            title: 'iPhone 15 Pro max',
          ),
        );
      },
    );
  }
}