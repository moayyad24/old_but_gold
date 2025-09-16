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
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 18,
        mainAxisSpacing: 21,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return ImageCard(
          imagePath: 'assets/images/test_image.png',
          title: 'iPhone 15 Pro max',
          isFavorite: index == 2,
        );
      },
    );
  }
}
