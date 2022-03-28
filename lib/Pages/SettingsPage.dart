import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  final Color _themeColor =const Color(0xff3b3b58);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
          backgroundColor: _themeColor,
        ),
    );
  }
}
