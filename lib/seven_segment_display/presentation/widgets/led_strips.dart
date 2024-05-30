import 'dart:math';

import 'package:flutter/material.dart';
import 'package:seven_segement_display/common/constants/constants.dart';
import 'package:seven_segement_display/seven_segment_display/presentation/widgets/draw_triangle_shape.dart';

class LedStrip extends StatelessWidget {
  const LedStrip(
      {super.key,
      required this.isOn,
      required this.isVertical,
      required this.x,
      required this.description,
      required this.y});
  final bool isOn;
  final bool isVertical;
  final double x;
  final double y;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Transform.rotate(
        angle: isVertical ? pi / 2 : 0,
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            CustomPaint(
              size: const Size(kThickness / 2, kThickness),
              painter: DrawTriangleShape(isOn ? kColor : kOffColor),
            ),
            Container(
              color: isOn ? kColor : kOffColor,
              width: kLength - kThickness,
              height: kThickness - 2,
              child: Center(
                child: isVertical
                    ? Transform.rotate(
                        angle: 3 * pi / 2,
                        child: Text(
                          description,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Text(
                        description,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
              ),
            ),
            Transform.rotate(
              angle: pi,
              child: CustomPaint(
                size: const Size(5, kThickness),
                painter: DrawTriangleShape(isOn ? kColor : kOffColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
