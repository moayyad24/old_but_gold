import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/features/home/ui/widgets/home_sliver_body.dart';
import 'package:old_but_gold/features/home/ui/widgets/home_top_section.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [HomeSliverAppBar(), HomeSliverBody()]),
      bottomNavigationBar: _buildCustomBottomBar(),
    );
  }

  Widget _buildCustomBottomBar() {
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
          _buildNavItem(Icons.home, 'Home', 0),
          _buildNavItem(Icons.favorite, 'Liked', 1),
          _buildNavItem(Icons.add_circle, 'Add', 2),
          _buildNavItem(Icons.inbox, 'Inbox', 3),
          _buildNavItem(Icons.person, 'Profile', 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData filledIcon, String label, int index) {
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: AnimatedContainer(
        height: 65,
        width: 75,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
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
            Icon(filledIcon, size: 24, color: Colors.black),
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
