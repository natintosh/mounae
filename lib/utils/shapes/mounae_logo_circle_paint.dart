import 'package:flutter/material.dart';

class MounaeLogoCirclePaint extends CustomPainter {
  final Color color;
  final double radius;

  MounaeLogoCirclePaint(this.color, this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    Path circularPath = Path();

    circularPath.addOval(
      Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
    );

    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawPath(circularPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
