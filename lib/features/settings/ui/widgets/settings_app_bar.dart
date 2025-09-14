import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiParameters.dPadding,
      child: Row(
        children: [
          SizedBox(
            width: 38.w,
            height: 38.w,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainFFEECA,
                elevation: 3,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: AppColors.black.withAlpha(50)),
                ),
              ),
              child: Icon(
                Icons.arrow_back,
                size: 24,
                color: AppColors.black,
              ),
            ),
          ),
          14.horizontalSpace,
          Text('Settings', style: AppTextStyles.bold26),
        ],
      ),
    );
  }
}
