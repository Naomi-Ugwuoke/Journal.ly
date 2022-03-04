import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Settings Page'),
          centerTitle: true,
          backgroundColor: const Color(0xff3b3b58),
        ),
      ),
    );
  }
}
