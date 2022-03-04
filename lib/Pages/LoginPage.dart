import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
          centerTitle: true,
        ),
        body: Column(children: const <Widget>[Text('Login'), Text('Register')]),
      ),
    );
  }
}
