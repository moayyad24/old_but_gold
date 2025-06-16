import 'package:flutter/material.dart';
import 'package:old_but_gold/features/home/ui/widgets/home_sliver_body.dart';
import 'package:old_but_gold/features/home/ui/widgets/home_top_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [HomeSliverAppBar(), HomeSliverBody()]),
    );
  }
}
