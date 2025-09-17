import 'package:flutter/material.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/app_bar_button.dart';

class ProfileTopBar extends StatelessWidget {
  const ProfileTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Profile', style: AppTextStyles.bold26),
          AppBarButton(
            onTap: () {
              Navigator.pushNamed(context, Routes.settingsScreen);
            },
            icon: Icons.settings_rounded,
          ),
        ],
      ),
    );
  }
}
