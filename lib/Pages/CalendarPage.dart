import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calendar'),
          centerTitle: true,
          backgroundColor: const Color(0xff28112b),
        ),
      ),
    );
  }
}
