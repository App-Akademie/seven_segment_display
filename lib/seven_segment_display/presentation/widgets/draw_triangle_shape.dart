import 'package:flutter/material.dart';

class DrawTriangleShape extends CustomPainter {
  late Paint painter1;
  late Paint painter2;

  DrawTriangleShape(Color color) {
    painter1 = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    painter2 = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(0, size.height / 2);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, painter1);

    canvas.drawLine(
        Offset(size.width, 0), Offset(0, size.height / 2), painter2);
    canvas.drawLine(
        Offset(0, size.height / 2), Offset(size.width, size.height), painter2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
