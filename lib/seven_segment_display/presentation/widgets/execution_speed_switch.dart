import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seven_segement_display/common/controller/segment_controller.dart';
import 'package:seven_segement_display/seven_segment_display/domain/executution_speed.dart';

class ExecutionSpeedSwitch extends StatelessWidget {
  const ExecutionSpeedSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildExecutionSpeedElement(ExecutionSpeed.halfSpeed, context, "x0.5"),
        _buildExecutionSpeedElement(ExecutionSpeed.normalSpeed, context, "x1"),
        _buildExecutionSpeedElement(ExecutionSpeed.doubleSpeed, context, "x2"),
      ],
    );
  }

  Widget _buildExecutionSpeedElement(
      ExecutionSpeed speed, BuildContext context, String label) {
    final segmentController = Provider.of<SegmentController>(context);
    bool currentSpeedIsSelected =
        segmentController.currentExecutionSpeed == speed;
    return GestureDetector(
      onTap: () => segmentController.changeExecutionSpeed(speed),
      child: Container(
        color: currentSpeedIsSelected
            ? const Color.fromARGB(255, 238, 190, 99)
            : const Color.fromARGB(255, 201, 159, 82),
        height: 30,
        width: 50,
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
