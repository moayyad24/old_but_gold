import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';

class ListTitle extends StatelessWidget {
  final String title;
  const ListTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 24.0,
        bottom: 16,
        top: 40,
      ),
      child: Text(title, style: AppTextStyles.bold20),
    );
  }
}
