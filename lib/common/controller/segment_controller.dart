import 'package:flutter/material.dart';
import 'package:seven_segement_display/seven_segment_display/domain/executution_speed.dart';
import 'package:seven_segement_display/seven_segment_display/domain/script_model.dart';

class SegmentController extends ChangeNotifier {
  List<ScriptModel> scripts = [];
  List<bool> ram = List<bool>.filled(7, false);
  ExecutionSpeed currentExecutionSpeed = ExecutionSpeed.normalSpeed;
  bool shouldStopExecution = false;
  bool executeInLoop = false;

  final Map<String, int> segmentMap = {
    '00001': 0, // a
    '00010': 1, // b
    '00011': 2, // c
    '00100': 3, // d
    '00101': 4, // e
    '00110': 5, // f
    '00111': 6, // g
  };

  Future<void> executeCommands(List<String> lines) async {
    shouldStopExecution = false;
    if (lines.isEmpty) return;
    // Go over each line of code and treat it accordingly.
    for (String l in lines) {
      if (shouldStopExecution) return;
      // Skip empty lines.
      if (l.isEmpty) continue;
      final line = l.trim();
      // Go over each command per line and act accordingly.
      for (String command in line.split(" ")) {
        for (ScriptModel script in scripts) {
          if (command == script.scriptName) {
            await executeCommands(script.commandLines);
          }
        }
        bool state = command[0] == '1';
        String segment = command.substring(1);

        // Switch all on or off when state + 11111 is encountered.
        if (segment == '11111') {
          ram = List<bool>.filled(7, state);
        }

        if (segmentMap.containsKey(segment)) {
          int? index = segmentMap[segment];
          if (index != null) {
            ram[index] = state;
          }
        }
        notifyListeners();
      }

      switch (currentExecutionSpeed) {
        case ExecutionSpeed.normalSpeed:
          await Future.delayed(const Duration(milliseconds: 1000));
        case ExecutionSpeed.doubleSpeed:
          await Future.delayed(const Duration(milliseconds: 500));
        case ExecutionSpeed.halfSpeed:
          await Future.delayed(const Duration(milliseconds: 2000));
      }
    }
    if (executeInLoop) {
      executeCommands(lines);
    }
  }

  void reset() {
    shouldStopExecution = true;
    ram = List<bool>.filled(7, false);
    notifyListeners();
  }

  void addScript(List<String> lines, String scriptName) {
    ScriptModel newScript =
        ScriptModel(scriptName: scriptName, commandLines: lines);
    scripts.add(newScript);
    notifyListeners();
  }

  void changeExecutionSpeed(ExecutionSpeed newExecutionSpeed) {
    currentExecutionSpeed = newExecutionSpeed;
    notifyListeners();
  }

  void changeLoopStatus(bool newStatus) {
    executeInLoop = newStatus;
    notifyListeners();
  }
}
