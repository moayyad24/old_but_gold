import 'package:flutter/material.dart';

class TopGradientContainer extends StatelessWidget {
  final Widget child;
  const TopGradientContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: AlignmentGeometry.xy(0, 0),
          stops: [0, 0.04, .3],
          colors: [Color(0xFFFFDC91), Color(0xFFFFDC90), Color(0xFFFFFFFF)],
        ),
      ),
      child: child,
    );
  }
}
