import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/widgets/app_search_text_field.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      width: 345.w,
      child: AppSearchTextField(
        hintText: 'Search for anything...',
        enabled: false,
        onPressed: () {
          Navigator.pushNamed(context, Routes.searchScreen);
        },
      ),
    );
  }
}
