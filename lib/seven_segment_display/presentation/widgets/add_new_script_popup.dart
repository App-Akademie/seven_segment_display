import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seven_segement_display/common/controller/segment_controller.dart';

class AddScriptAlertDialog extends StatelessWidget {
  const AddScriptAlertDialog({super.key, required this.scriptLines});

  final List<String> scriptLines;

  @override
  Widget build(BuildContext context) {
    final segmentController = Provider.of<SegmentController>(context);
    TextEditingController controller = TextEditingController();
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 133, 133, 133),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: "Script Name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
              onPressed: () {
                segmentController.addScript(scriptLines, controller.text);
                Navigator.pop(context);
              },
              child: const Text("ADD SCRIPT"))
        ],
      ),
    );
  }
}
