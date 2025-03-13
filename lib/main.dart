import 'package:flutter/material.dart';
import 'package:tam/views/ScheduleView.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SchedulePage(station: 'Comédie', line: '1', direction: '1'),
    );
  }
}
