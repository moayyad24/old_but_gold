import 'package:flutter/material.dart';
import 'package:old_but_gold/features/home/ui/widgets/categories_list_view.dart';
import 'package:old_but_gold/features/home/ui/widgets/home_content_area.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeContentArea(child: Column(children: [CategoriesListView()]));
  }
}
