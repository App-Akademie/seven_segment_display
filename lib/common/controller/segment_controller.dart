import 'package:flutter/material.dart';

class SegmentController extends ChangeNotifier {
  List<bool> ram = List<bool>.filled(7, false);
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
    for (String line in lines) {
      bool state = line[0] == '1';
      String segment = line.substring(1);

      if (segmentMap.containsKey(segment)) {
        int? index = segmentMap[segment];
        if (index != null) {
          ram[index] = state;
        }
        notifyListeners();
      }

      await Future.delayed(const Duration(seconds: 1));
    }
  }

  void reset() {
    ram = List<bool>.filled(7, false);
    notifyListeners();
  }
}
