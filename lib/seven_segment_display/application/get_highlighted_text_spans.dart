import 'package:flutter/material.dart';

List<TextSpan> getHighlightedTextSpans(
    TextEditingController controller, int highlightedLine) {
  final text = controller.text;
  final lines = text.split('\n');
  final spans = <TextSpan>[];

  for (int i = 0; i < lines.length; i++) {
    final isHighlightedLine = i == highlightedLine;
    spans.add(
      TextSpan(
        text: lines[i] + (i < lines.length - 1 ? '\n' : ''),
        style: TextStyle(
          fontSize: 17,
          backgroundColor: isHighlightedLine
              ? const Color.fromARGB(255, 238, 190, 99)
              : Colors.transparent,
          color: Colors.black,
        ),
      ),
    );
  }

  return spans;
}
