import 'dart:math' as math;

import 'package:flutter/material.dart';

class FindMeButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FindMeButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: onPressed,
      child: Transform.rotate(
        angle: math.pi / 4,
        child: const Icon(Icons.navigation_outlined),
      ),
    );
  }
}
