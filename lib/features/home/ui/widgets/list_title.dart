import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class ListTitle extends StatelessWidget {
  final String title;
  const ListTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        bottom: 16,
        top: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.bold20),
          Text(
            'More >',
            style: AppTextStyles.bold18.copyWith(color: AppColors.green006A6F),
          ),
        ],
      ),
    );
  }
}
