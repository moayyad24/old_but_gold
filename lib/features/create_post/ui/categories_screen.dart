import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';
import 'package:old_but_gold/core/widgets/content_area.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/core/widgets/text_with_icon_app_bar.dart';
import 'package:old_but_gold/features/create_post/ui/widgets/categories_list.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: UiParameters.dPadding,
            child: TextWithIconAppBar(title: 'Categories', icon: Icons.cancel),
          ),
          ContentArea(
            child: Column(children: [DragHandle(), CategoriesList()]),
          ),
        ],
      ),
    );
  }
}
