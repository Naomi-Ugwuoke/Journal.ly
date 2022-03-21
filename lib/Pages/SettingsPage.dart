import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
          backgroundColor: const Color(0xff3b3b58),
        ),
        body: Container(
          width: double.infinity,
          child: Column(children: [
            
          ]),
        ),
    );
  }
}
