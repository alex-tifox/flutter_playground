import 'package:flutter/material.dart';
import 'package:flutter_playground/custom_paint_map_pin/custom_paint_pin.dart';

class CustomPaintPinScreen extends StatelessWidget {
  const CustomPaintPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Round Pin Example'),
      ),
      body: const Center(
        child: RoundPin(rating: 4),
      ),
    );
  }
}
