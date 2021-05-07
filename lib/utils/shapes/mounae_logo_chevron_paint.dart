import 'package:flutter/material.dart';

class MounaeLogoChevronPaint extends CustomPainter {
  final Color color;

  MounaeLogoChevronPaint(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Path chevronPath = Path();

    Offset bottomLeft = size.bottomLeft(Offset.zero);
    Offset bottomRight = size.bottomRight(Offset.zero);
    Offset topCenter = size.topCenter(Offset.zero);

    chevronPath.moveTo(bottomLeft.dx, bottomLeft.dy - 2);
    chevronPath.lineTo(topCenter.dx, topCenter.dy);
    chevronPath.lineTo(bottomRight.dx, bottomRight.dy - 2);

    chevronPath.arcToPoint(bottomRight + Offset(-2, 0),
        radius: Radius.circular(4));

    chevronPath.close();

    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawPath(chevronPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
