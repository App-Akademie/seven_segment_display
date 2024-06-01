import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seven_segement_display/common/controller/segment_controller.dart';
import 'package:seven_segement_display/seven_segment_display/presentation/widgets/add_new_script_popup.dart';
import 'package:seven_segement_display/seven_segment_display/presentation/widgets/digit.dart';
import 'package:seven_segement_display/seven_segment_display/presentation/widgets/execution_speed_switch.dart';
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
    final segmentController = Provider.of<SegmentController>(context);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          const RamValueDisplay(),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(border: Border.all()),
                  child: const Digit()),
            ],
          ),
          const SizedBox(height: 30),
          const ExecutionSpeedSwitch(),
          const SizedBox(height: 30),
          Switch(
            value: segmentController.executeInLoop,
            onChanged: (bool value) {
              segmentController.changeLoopStatus(value);
            },
          ),
          const SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Scripts:"),
            const SizedBox(width: 15),
            ...segmentController.scripts.map((model) {
              return Text("${model.scriptName},");
            }),
          ]),
          const SizedBox(height: 30),
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
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () => segmentController
                    .executeCommands(controller.text.split('\n')),
                child: const Text("EXECUTE"),
              ),
              const SizedBox(width: 15),
              OutlinedButton(
                onPressed: () => segmentController.reset(),
                child: const Text("RESET"),
              ),
              const SizedBox(width: 15),
              OutlinedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AddScriptAlertDialog(
                          scriptLines: controller.text.split('\n'));
                    },
                  );
                },
                child: const Text("ADD SCRIPT"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
