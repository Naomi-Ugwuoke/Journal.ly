import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          centerTitle: true,
          backgroundColor: const Color(0xff2c4251),
        ),
      ),
    );
  }
}
