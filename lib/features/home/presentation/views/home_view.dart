import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}