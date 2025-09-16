import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/widgets/app_bar_button.dart';
import 'package:old_but_gold/core/widgets/app_search_text_field.dart';
import 'package:old_but_gold/features/home/ui/widgets/items_list_view.dart';
import 'package:old_but_gold/features/home/ui/widgets/list_title.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50),
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
            child: Row(
              children: [
                AppBarButton(),
                14.horizontalSpace,
                Expanded(
                  child: AppSearchTextField(hintText: 'Search for items...'),
                ),
              ],
            ),
          ),
          ListTitle(title: 'Electronics'),
          ItemsListView(),
          ListTitle(title: 'Clothes'),
          ItemsListView(),
          ListTitle(title: 'Nearby'),
          ItemsListView(),
          30.verticalSpace,
        ],
      ),
    );
  }
}
