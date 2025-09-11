import 'package:flutter/material.dart';
import 'package:old_but_gold/features/create_post/ui/create_post_screen.dart';
import 'package:old_but_gold/features/create_post/ui/widgets/post_bottom_navbar.dart';

class CreatePostMainScreen extends StatelessWidget {
  const CreatePostMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CreatePostScreen(),
      bottomNavigationBar: PostBottomNavBar(),
    );
  }
}
