import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seven_segement_display/common/controller/segment_controller.dart';
import 'package:seven_segement_display/seven_segment_display/domain/execution_speed_model.dart';
import 'package:seven_segement_display/seven_segment_display/domain/executution_speed.dart';

class ExecutionSpeedSwitch extends StatelessWidget {
  const ExecutionSpeedSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final segmentController = Provider.of<SegmentController>(context);
    final speeds = [
      ExecutionSpeedData(ExecutionSpeed.halfSpeed, "x0.5"),
      ExecutionSpeedData(ExecutionSpeed.normalSpeed, "x1"),
      ExecutionSpeedData(ExecutionSpeed.doubleSpeed, "x2"),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: speeds.map((speedData) {
        bool currentSpeedIsSelected =
            segmentController.currentExecutionSpeed == speedData.speed;
        return InkWell(
          onTap: () => segmentController.changeExecutionSpeed(speedData.speed),
          child: Container(
            color: currentSpeedIsSelected
                ? const Color.fromARGB(255, 238, 190, 99)
                : const Color.fromARGB(255, 201, 159, 82),
            height: 30,
            width: 50,
            child: Center(
              child: Text(speedData.label),
            ),
          ),
        );
      }).toList(),
    );
  }
}
