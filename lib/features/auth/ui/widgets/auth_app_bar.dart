import 'package:flutter/material.dart';
import 'package:old_but_gold/core/widgets/app_back_button.dart';

class AuthAppBar extends StatelessWidget {
  final Widget stepper;
  const AuthAppBar({super.key, required this.stepper});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBackButton(),
          stepper,
          Text(
            'Skip',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              decorationThickness: 1.2,
              decorationColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
