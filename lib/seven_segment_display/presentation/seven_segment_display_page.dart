import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seven_segement_display/common/controller/segment_controller.dart';
import 'package:seven_segement_display/seven_segment_display/presentation/widgets/digit.dart';
import 'package:seven_segement_display/seven_segment_display/presentation/widgets/ram_value_display.dart';

class SevenSegmentDisplayPage extends StatefulWidget {
  const SevenSegmentDisplayPage({super.key});

  @override
  State<SevenSegmentDisplayPage> createState() =>
      _SevenSegmentDisplayPageState();
}

class _SevenSegmentDisplayPageState extends State<SevenSegmentDisplayPage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final segementController = Provider.of<SegmentController>(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          const RamValueDisplay(),
          const SizedBox(
            height: 50,
          ),
          const Digit(),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: SizedBox(
              width: 300,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                minLines: 3,
                maxLines: 8,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton(
              onPressed: () => segementController
                  .executeCommands(controller.text.split('\n')),
              child: const Text("EXECUTE")),
          OutlinedButton(
              onPressed: () => segementController.reset(),
              child: const Text("RESET"))
        ],
      ),
    );
  }
}
