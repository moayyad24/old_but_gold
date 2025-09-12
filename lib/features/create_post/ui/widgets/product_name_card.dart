import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';

class ProductNameCard extends StatelessWidget {
  const ProductNameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiParameters.hPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 220.w,
            child: Text(
              "iPhone 15 Pro max 128 GB / 6RAM",
              style: AppTextStyles.bold24,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text("May 28", style: AppTextStyles.semiBold17),
        ],
      ),
    );
  }
}
