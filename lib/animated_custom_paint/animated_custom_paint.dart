import 'package:flutter/material.dart';

class AnimatedPolylinePainter extends CustomPainter {
  final List<Offset> points;
  final double progress;

  AnimatedPolylinePainter({
    required this.points,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    // calculate whole polyline length
    double length = 0;
    for (var i = 0; i < points.length - 1; i++) {
      length += (points[i + 1] - points[i]).distance;
    }

    // calculate the current polyline length
    double currentLength = 0;
    for (var i = 0; i < points.length - 1; i++) {
      final segmentLength = (points[i + 1] - points[i]).distance;
      final segmentProgress = segmentLength / length;
      if (currentLength + segmentLength > length * progress) {
        final segmentProgress =
            (length * progress - currentLength) / segmentLength;
        path.moveTo(points[i].dx, points[i].dy);
        path.lineTo(
          points[i].dx + (points[i + 1].dx - points[i].dx) * segmentProgress,
          points[i].dy + (points[i + 1].dy - points[i].dy) * segmentProgress,
        );
        break;
      } else {
        path.moveTo(points[i].dx, points[i].dy);
        path.lineTo(points[i + 1].dx, points[i + 1].dy);
        currentLength += segmentLength;
      }
    }

    // Draw the completed path on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint when animation updates
  }
}

class AnimatedPainterExample extends StatefulWidget {
  static const routeName = '/animated-painter-example';
  const AnimatedPainterExample({super.key});

  @override
  _AnimatedPainterExampleState createState() => _AnimatedPainterExampleState();
}

class _AnimatedPainterExampleState extends State<AnimatedPainterExample>
    with SingleTickerProviderStateMixin {
  // points to emulate roads in some city region
  final points = [
    Offset(50, 50),
    Offset(100, 80),
    Offset(150, 80),
    Offset(200, 90),
    Offset(250, 50),
    Offset(300, 40),
    Offset(350, 30),
    Offset(400, 15),
  ];

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Duration of the animation
    );

    // Define an animation that ranges from 0 to 100 (radius of the circle)
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )..addListener(() {
        setState(() {});
      });

    // Start the animation
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Custom Painter Example')),
      body: Column(
        children: [
          SizedBox(
            width: 400,
            height: 400,
            child: CustomPaint(
              painter: AnimatedPolylinePainter(
                points: points,
                progress: _animation.value,
              ),
              child: Container(
                width: 100,
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
