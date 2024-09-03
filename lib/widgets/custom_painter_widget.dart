import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPainterWidget extends CustomPainter {

  final Color color;

  CustomPainterWidget(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color =  color;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = Path();
    path.moveTo(0, size.height );
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}