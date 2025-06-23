import 'package:flutter/material.dart';
import 'package:old_but_gold/features/home/ui/widgets/categories_list_view.dart';
import 'package:old_but_gold/features/home/ui/widgets/home_content_area.dart';
import 'package:old_but_gold/features/home/ui/widgets/items_grid_view.dart';
import 'package:old_but_gold/features/home/ui/widgets/items_list_view.dart';
import 'package:old_but_gold/features/home/ui/widgets/items_list_view_with_background_image.dart';
import 'package:old_but_gold/features/home/ui/widgets/list_title.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeContentArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoriesListView(),
          ListTitle(title: 'Nearby'),
          ItemsGridView(),
          ListTitle(title: 'Lowest Prices Ever'),
          ItemsListViewWithBackgroundImage(),
          ListTitle(title: 'Flash Sales'),
          ItemsListView(),
        ],
      ),
    );
  }
}
