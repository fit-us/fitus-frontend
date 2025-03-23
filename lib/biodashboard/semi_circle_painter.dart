import 'package:flutter/material.dart';
import "dart:math" as math;

class SemiCirclePainter extends CustomPainter {
  final Color backgroundColor;
  final LinearGradient gradient;
  final double strokeWidth;
  final double fillPercentage;

  SemiCirclePainter({
    required this.backgroundColor,
    required this.gradient,
    required this.strokeWidth,
    required this.fillPercentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width * 2;
    final double height = size.height * 2;
    final double radius = (width - strokeWidth) / 2;
    final double shiftX = 75.0;
    final Offset center = Offset((width / 2) - shiftX, height / 2);
    final Rect boundingRect = Rect.fromCircle(center: center, radius: radius);

    final Paint backgroundPaint =
        Paint()
          ..color = backgroundColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round;

    canvas.drawArc(boundingRect, math.pi, math.pi, false, backgroundPaint);

    if (fillPercentage > 0) {
      final Paint foregroundPaint =
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth
            ..strokeCap = StrokeCap.round
            ..shader = gradient.createShader(boundingRect);

      // Draw the foreground semi-circle
      canvas.drawArc(
        boundingRect,
        math.pi, // Start angle (180 degrees)
        math.pi * fillPercentage, // Sweep angle based on fill percentage
        false,
        foregroundPaint,
      );
    }
  }

  @override
  bool shouldRepaint(SemiCirclePainter oldDelegate) {
    return oldDelegate.fillPercentage != fillPercentage;
  }
}
