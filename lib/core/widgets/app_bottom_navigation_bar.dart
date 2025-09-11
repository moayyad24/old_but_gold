import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:old_but_gold/core/constants/routes.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onIndexChanged;
  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(width: 1, color: AppColors.greyB7B7B7)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarItem(
            icon: 'assets/icons/house.svg',
            label: 'Home',
            index: 0,
            currentIndex: currentIndex,
            onTap: onIndexChanged,
          ),
          _NavBarItem(
            icon: 'assets/icons/liked.svg',
            label: 'Liked',
            index: 1,
            currentIndex: currentIndex,
            onTap: onIndexChanged,
          ),
          _NavBarItem(
            icon: 'assets/icons/add.svg',
            label: 'Add',
            index: 2,
            currentIndex: currentIndex,
            onTap: (i) {
              Navigator.pushNamed(context, Routes.createPostScreen);
            },
          ),
          _NavBarItem(
            icon: 'assets/icons/inbox.svg',
            label: 'Inbox',
            index: 3,
            currentIndex: currentIndex,
            onTap: onIndexChanged,
          ),
          _NavBarItem(
            icon: 'assets/icons/profile.svg',
            label: 'Profile',
            index: 4,
            currentIndex: currentIndex,
            onTap: onIndexChanged,
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String icon;
  final String label;
  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = index == currentIndex;
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        height: 68.h,
        width: 70.w,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          gradient:
              isSelected
                  ? const LinearGradient(
                    colors: [
                      Color(0xFFFFDC91),
                      Color(0xFFFFDC90),
                      Color(0xFFFFFFFF),
                    ],
                    stops: [0, 0.76, 1],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
                  : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
