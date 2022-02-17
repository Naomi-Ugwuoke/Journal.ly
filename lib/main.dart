// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import './welcomePageSteps.dart';

void main() =>  runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: 'Journal.ly',
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {

  var i = 0;

  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff3a1c71), Color(0xffd76d77), Color(0xffffaf7b)]
            )
          ),
          child: const WelcomePageStep()
        ),
      ),
    );
  }
  

}