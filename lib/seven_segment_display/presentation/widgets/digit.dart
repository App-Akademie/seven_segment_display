import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seven_segement_display/common/constants/constants.dart';
import 'package:seven_segement_display/common/controller/segment_controller.dart';
import 'package:seven_segement_display/seven_segment_display/presentation/widgets/led_strip.dart';

class Digit extends StatelessWidget {
  const Digit({super.key});

  @override
  Widget build(BuildContext context) {
    final segementController = Provider.of<SegmentController>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: kLength * 2 + kThickness,
      width: kLength + kThickness,
      child: Stack(
        children: [
          //A
          LedStrip(
            isOn: segementController.ram[0],
            isVertical: false,
            x: kThickness / 2,
            y: 0,
            description: "a",
          ),
          //B
          LedStrip(
            isOn: segementController.ram[1],
            isVertical: true,
            x: kLength + kThickness,
            y: kThickness / 2,
            description: "b",
          ),
          //C
          LedStrip(
            isOn: segementController.ram[2],
            isVertical: true,
            x: kLength + kThickness,
            y: kThickness / 2 + kLength,
            description: "c",
          ),
          //D
          LedStrip(
            isOn: segementController.ram[3],
            isVertical: false,
            x: kThickness / 2,
            y: (2 * kLength),
            description: "d",
          ),
          //E
          LedStrip(
            isOn: segementController.ram[4],
            isVertical: true,
            x: kThickness,
            y: kThickness / 2 + kLength,
            description: "e",
          ),
          //F
          LedStrip(
            isOn: segementController.ram[5],
            isVertical: true,
            x: kThickness,
            y: kThickness / 2,
            description: "f",
          ),
          //G
          LedStrip(
            isOn: segementController.ram[6],
            isVertical: false,
            x: kThickness / 2,
            y: kLength,
            description: "g",
          ),
        ],
      ),
    );
  }
}
