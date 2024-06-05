import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seven_segement_display/common/controller/highlight_line_controller.dart';
import 'package:seven_segement_display/common/controller/segment_controller.dart';
import 'package:seven_segement_display/seven_segment_display/application/get_highlighted_text_spans.dart';
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
    final highlightingController =
        Provider.of<HighlightLineController>(context);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
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
              const Text("Funktionen:"),
              const SizedBox(width: 15),
              ...segmentController.scripts.map((model) {
                return Text("${model.scriptName},");
              }),
            ]),
            const SizedBox(height: 30),
            !segmentController.executing
                ? Center(
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
                  )
                : Container(
                    height: 120,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 73, 73, 73)),
                        borderRadius: BorderRadius.circular(7)),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: RichText(
                            text: TextSpan(
                                children: getHighlightedTextSpans(controller,
                                    highlightingController.highlightedLine))),
                      ),
                    ),
                  ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () => segmentController.executeCommands(
                      controller.text.split('\n'), highlightingController),
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
                  child: const Text("ADD FUNCTION"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
