import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';


class PostBottomNavBar extends StatelessWidget {
  const PostBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xFFFFF6DC),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainFFE09C,
                foregroundColor: AppColors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(10),
                    bottomStart: Radius.circular(10),
                  ),
                ),
                elevation: 0,
                minimumSize: Size(139.w, 48.h),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Next', style: AppTextStyles.bold20),
                  SizedBox(width: 18.w),
                  Icon(Icons.arrow_forward, size: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
