import 'package:flutter/material.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
