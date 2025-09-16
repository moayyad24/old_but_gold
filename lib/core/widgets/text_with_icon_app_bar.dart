import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/app_bar_button.dart';

class TextWithIconAppBar extends StatelessWidget {
  final String title;
  final IconData icon;
  const TextWithIconAppBar({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.bold26),
        AppBarButton(icon: icon),
      ],
    );
  }
}
