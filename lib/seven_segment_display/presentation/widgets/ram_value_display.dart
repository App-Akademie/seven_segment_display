import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seven_segement_display/common/controller/segment_controller.dart';

class RamValueDisplay extends StatefulWidget {
  const RamValueDisplay({super.key});

  @override
  State<RamValueDisplay> createState() => _RamValueDisplayState();
}

class _RamValueDisplayState extends State<RamValueDisplay> {
  @override
  Widget build(BuildContext context) {
    final segmentController = Provider.of<SegmentController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: segmentController.ram.map((bool value) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: value ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            value ? '1' : '0',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),
    );
  }
}
