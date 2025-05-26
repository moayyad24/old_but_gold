import 'package:flutter/material.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_field.dart';
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
          ContentArea(
            addPadding: true,
            child: Column(
              children: [
                DragHandle(),
                SizedBox(height: 20),
                Text(
                  'Login',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 36),
                AuthField(
                  fieldTitle: 'Email',
                  hintText: 'Email@example.com',
                  iconPath: 'assets/icons/user_icon.svg',
                  myController: TextEditingController(),
                  checkValid: (p0) {
                    return '';
                  },
                ),
                SizedBox(height: 20),
                AuthField(
                  fieldTitle: 'Password',
                  hintText: 'Enter Your Password',
                  iconPath: 'assets/icons/lock.svg',
                  myController: TextEditingController(),
                  isObscure: true,
                  checkValid: (p0) {
                    return '';
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
