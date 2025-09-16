import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/widgets/app_content_area.dart';
import 'package:old_but_gold/features/home/ui/widgets/categories_list_view.dart';
import 'package:old_but_gold/features/home/ui/widgets/items_grid_view.dart';
import 'package:old_but_gold/features/home/ui/widgets/items_list_view.dart';
import 'package:old_but_gold/features/home/ui/widgets/list_title.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContentArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoriesListView(),
          ListTitle(title: 'Nearby'),
          ItemsGridView(),
          ListTitle(title: 'Lowest Prices Ever'),
          ItemsListView(),
          ListTitle(title: 'Flash Sales'),
          ItemsListView(),
          20.verticalSpace,
        ],
      ),
    );
  }
}
