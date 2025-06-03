import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/widgets/app_back_button.dart';

class TextWithIconAppBar extends StatelessWidget {
  final String title;
  const TextWithIconAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 26,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppBackButton(icon: Icons.cancel),
      ],
    );
  }
}
