import 'package:flutter/material.dart';

void main() => runApp(const Welcome());


class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
          centerTitle: true,
        ),
        body: Column(
          children: const <Widget>[
            Text('Login'),
            Text('Register')
          ]),
      ),
    );
  }
}