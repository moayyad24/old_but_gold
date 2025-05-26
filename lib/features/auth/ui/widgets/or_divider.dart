import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.greyB7B7B7, thickness: 0.6)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            t.auth.or,
            style: TextStyle(
              color: AppColors.darkGrey666666,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(child: Divider(color: AppColors.greyB7B7B7, thickness: 0.6)),
      ],
    );
  }
}
