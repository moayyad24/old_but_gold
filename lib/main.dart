import 'package:flutter/material.dart';
import 'package:old_but_gold/features/auth/ui/login_screen.dart';

void main() {
  runApp(const OldButGold());
}

class OldButGold extends StatelessWidget {
  const OldButGold({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OBG',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginScreen(),
    );
  }
}
