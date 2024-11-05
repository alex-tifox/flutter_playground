import 'package:flutter/material.dart';
import 'package:flutter_playground/features_menu_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FeaturesMenuList(),
    );
  }
}
