import 'package:flutter/material.dart';
import 'package:old_but_gold/core/constants/routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.personalInformationScreen);
        },
        child: Text('Personal Information'),
      ),
    );
  }
}
