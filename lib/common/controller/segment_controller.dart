import 'package:flutter/material.dart';

class SegmentController extends ChangeNotifier {
  List<bool> ram = List<bool>.filled(7, false);
  final Map<String, int> segmentMap = {
    '00000': 0,
    '00001': 1,
    '00010': 2,
    '00011': 3,
    '00100': 4,
    '00101': 5,
    '00110': 6,
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
