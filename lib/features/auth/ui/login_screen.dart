import 'package:flutter/material.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/features/auth/ui/widgets/content_area.dart';
import 'package:old_but_gold/features/auth/ui/widgets/custom_stepper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppBar(
            stepper: CustomStepper(
              dots: [DotState.completed, DotState.current, DotState.next],
            ),
          ),
          ContentArea(child: Column()),
        ],
      ),
    );
  }
}
