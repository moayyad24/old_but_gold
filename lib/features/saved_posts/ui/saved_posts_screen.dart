import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';
import 'package:old_but_gold/core/widgets/app_bar_button.dart';
import 'package:old_but_gold/core/widgets/top_gradient_container.dart';
import 'package:old_but_gold/features/saved_posts/ui/widgets/product_card.dart';

class SavedPostsScreen extends StatelessWidget {
  const SavedPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TopGradientContainer(
      child: Padding(
        padding: UiParameters.hPadding.copyWith(bottom: 20),
        child: CustomScrollView(
          clipBehavior: Clip.none,
          slivers: [
            SliverAppBar(
              expandedHeight: 80.h,
              actions: [AppBarButton(icon: Icons.search)],
              clipBehavior: Clip.none,
              forceMaterialTransparency: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsetsDirectional.only(
                  top: 10,
                  bottom: 12,
                ),
                expandedTitleScale: 1.6,
                title: Text(
                  'Saved Posts',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 20),
              sliver: SliverList.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ProductCard(
                    imageUrl: 'assets/images/test_image.png',
                    title: 'AirJordan shoes',
                    description:
                        'Pre-owned iPhone 15 in excellent condition...',
                    location: 'Nearby',
                    price: 25.99,
                    onFavoriteTap: () {
                      // print("Favorite tapped!");
                    },
                  );
                },
                separatorBuilder: (context, index) => 20.verticalSpace,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
