import 'package:flutter/material.dart';

class HighlightLineController extends ChangeNotifier {
  int highlightedLine = 0;

  void highlightLine(int lineNumber) {
    highlightedLine = lineNumber - 1;
    notifyListeners();
  }
}
