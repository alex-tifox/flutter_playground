import 'dart:math';

import 'package:flutter/material.dart';

class RoundPin extends StatelessWidget {
  final double rating;
  final double pinSize;
  final double elevation;

  const RoundPin({
    this.rating = 0.0,
    this.pinSize = 100.0,
    this.elevation = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: pinSize * 1.1,
      width: pinSize,
      child: Material(
        color: Colors.white,
        elevation: elevation,
        shape: CustomPinBorder(
          arrowHeight: pinSize * 0.1,
          arrowWidth: pinSize * 0.16,
          pinRadius: pinSize / 2,
        ),
        // borderRadius: BorderRadius.circular(pinSize / 2),
        child: CustomPaint(
          painter: PinPainter(rating),
          child: Center(
            child: Align(
              alignment: Alignment(0, -0.1),
              child: Text(
                rating.toString(),
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PinPainter extends CustomPainter {
  final double rating;

  PinPainter(this.rating);

  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    final double strokeWidth = 4.0;
    final double radius = size.width / 2;
    final double smallRadius = radius - 10;

    final Paint borderPaint2 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    const double startAngle = -pi / 2;
    final double sweepAngle = (rating / 5) * 2 * pi;

    final effectiveHeight = size.height - size.width * 0.1;
    if (rating > 0) {
      canvas.drawCircle(
        Offset(radius, radius),
        smallRadius - strokeWidth / 2,
        Paint()
          ..color = Colors.grey.withOpacity(0.3)
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth,
      );
      canvas.drawArc(
        Rect.fromCircle(
            center: Offset(radius, radius),
            radius: smallRadius - strokeWidth / 2),
        startAngle,
        sweepAngle,
        false,
        borderPaint2,
      );
    }

    final arrowSize = Size(size.width * 0.16, size.width * 0.1);

    final Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final path = Path()
      // Move the start to the bottom center of the circle
      ..moveTo(size.width / 2 - arrowSize.width / 2, effectiveHeight)
      // ..lineTo(size.width / 2, effectiveHeight + arrowSize.height)
      ..lineTo(size.width / 2 + arrowSize.width / 2, effectiveHeight);

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomPinBorder extends ShapeBorder {
  final double arrowWidth;
  final double arrowHeight;
  final double pinRadius;

  const CustomPinBorder({
    this.arrowWidth = 16.0,
    this.arrowHeight = 10.0,
    this.pinRadius = 50.0,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(pinRadius);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path(); // Not needed for a pin border
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();

    // Main circle
    path.addOval(
      Rect.fromCircle(
          center: Offset(rect.center.dx, rect.center.dy - arrowHeight / 2),
          radius: pinRadius),
    );

    path
      ..moveTo(
          rect.size.width / 2 - arrowWidth / 2, rect.size.height - arrowHeight)
      ..lineTo(rect.size.width / 2, rect.size.height)
      ..lineTo(
          rect.size.width / 2 + arrowWidth / 2, rect.size.height - arrowHeight);

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // Not needed for a pin border
  }

  @override
  ShapeBorder scale(double t) {
    return CustomPinBorder(
      arrowWidth: arrowWidth * t,
      arrowHeight: arrowHeight * t,
      pinRadius: pinRadius * t,
    );
  }
}
