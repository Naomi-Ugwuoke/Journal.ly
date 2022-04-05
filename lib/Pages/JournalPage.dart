import 'package:flutter/material.dart';

class JournalPage extends StatelessWidget {
  final DateTime? selectedDay;
  const JournalPage(this.selectedDay, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateToOpen = selectedDay ?? DateTime.now();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Journal Page'),
          centerTitle: true,
          backgroundColor: const Color(0xff28587b),
        ),
      ),
    );
  }
}
