import 'package:flutter/material.dart';
import 'package:old_but_gold/core/widgets/app_bottom_navigation_bar.dart';
import 'package:old_but_gold/features/home/ui/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier(0);

  final List<Widget> _screens = [
    const HomeScreen(),
    const Center(child: Text('Liked Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Add Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Inbox Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ];
  @override
  void dispose() {
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _currentIndexNotifier,
      builder: (context, index, _) {
        return Scaffold(
          body: _screens[index],
          bottomNavigationBar: AppBottomNavigationBar(
            currentIndex: index,
            onIndexChanged:
                (newIndex) => _currentIndexNotifier.value = newIndex,
          ),
        );
      },
    );
  }
}
