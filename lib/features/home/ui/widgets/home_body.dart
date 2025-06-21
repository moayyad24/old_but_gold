import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/features/home/ui/widgets/categories_list_view.dart';
import 'package:old_but_gold/features/home/ui/widgets/home_content_area.dart';
import 'package:old_but_gold/features/home/ui/widgets/items_grid_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeContentArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoriesListView(),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 24.0,
              bottom: 16,
              top: 40,
            ),
            child: Text('Nearby', style: AppTextStyles.bold20),
          ),
          ItemsGridView(),
        ],
      ),
    );
  }
}
