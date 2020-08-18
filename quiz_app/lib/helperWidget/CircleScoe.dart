import 'dart:math';

import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter {
  double correctAnswers;

  CircleProgress({this.correctAnswers});

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCircle = Paint()
      ..strokeWidth = 7
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    Paint completArc = Paint()
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..color = correctAnswers >= 5 ? Colors.green : Colors.red
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);

    double raduis = min(size.width / 2, size.height / 2) - 7;

    canvas.drawCircle(center, raduis, outerCircle);

    double angle = 2 * pi * ((correctAnswers * 10) / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: raduis), -pi / 2,
        angle, false, completArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
