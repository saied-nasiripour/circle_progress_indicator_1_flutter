import 'package:flutter/cupertino.dart';
import 'dart:math';

class CircleProgress extends CustomPainter {
  final strokeCircle = 13.0;
  double currentProgress;
  Color strokeColor;
  Color arcColor;
  double customStartAngle;

  CircleProgress(this.currentProgress, this.strokeColor, this.arcColor,
      this.customStartAngle); //    pi/2  or   -pi/2

  @override
  void paint(Canvas canvas, Size size) {
    // draw circle
    Paint circle = Paint()
      ..strokeWidth = strokeCircle
      ..color = strokeColor
      ..style = PaintingStyle.stroke;

    // center of device
    Offset center = Offset(size.width / 2, size.height / 2);

    // radius of circle
    double radius = 150.0;

    canvas.drawCircle(center, radius, circle);

    // draw animation
    Paint animationArc = Paint()
      ..strokeWidth = strokeCircle
      ..color = arcColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (currentProgress / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      customStartAngle,
      angle,
      false,
      animationArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
