import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PercentageCircle extends StatelessWidget {
  final double radius;
  final double percentage;
  const PercentageCircle(
      {super.key, required this.radius, required this.percentage})
      : assert(percentage <= 1);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(radius * 2, radius * 2),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(NumberFormat.decimalPercentPattern(decimalDigits: 1)
                .format(percentage)),
          ),
          CustomPaint(
            size: Size(radius * 2, radius * 2),
            painter: PercentageCirclePainter(percentage, Theme.of(context)),
          ),
        ],
      ),
    );
  }
}

class PercentageCirclePainter extends CustomPainter {
  final double percentage;
  final ThemeData theme;
  PercentageCirclePainter(this.percentage, this.theme);

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..strokeWidth = 2
      ..color = theme.colorScheme.secondary
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCenter(center: center, width: size.width, height: size.width),
      -0.5 * pi,
      2 * pi * percentage,
      false,
      paint,
    );
    paint.shader = ui.Gradient.radial(
        center,
        size.height,
        [Colors.white.withOpacity(0), Colors.white.withOpacity(0.6)],
        [0.3, 0.8]);
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(center, size.height / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
