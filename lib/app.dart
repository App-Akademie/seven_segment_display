import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seven_segement_display/common/controller/highlight_line_controller.dart';
import 'package:seven_segement_display/common/controller/segment_controller.dart';
import 'package:seven_segement_display/seven_segment_display/presentation/seven_segment_display_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SegmentController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HighlightLineController(),
        )
      ],
      child: const MaterialApp(home: SevenSegmentDisplayPage()),
    );
  }
}
