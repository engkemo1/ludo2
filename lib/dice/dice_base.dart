import 'dart:math';

import 'package:flutter/material.dart';

class DiceBasePainter extends CustomPainter {
  double _startAngle;

  DiceBasePainter(this._startAngle);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = size.width;

    var center = Offset(size.width / 2, size.width / 2);
    var acrAngle = 40 * pi / 180;

    for (int arcIndex = 0; arcIndex < 12; arcIndex++) {
      canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          _startAngle,
          acrAngle,
          false,
          Paint()
            ..color = arcIndex % 2 == 0 ? Colors.black : Colors.white
            ..strokeWidth = 1
            ..style = PaintingStyle.stroke);

      _startAngle += acrAngle;
    }

    canvas.drawCircle(
        center,
        radius,
        Paint()
          ..color = Colors.white.withOpacity(0.1)
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
