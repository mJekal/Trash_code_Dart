import 'package:flutter/material.dart';
import 'package:flutter_application_2/widget_screen/timerWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
      home: TimerStart(),
    );
  }
}


