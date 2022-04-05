import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_bug_chasers/Pages/WelcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:the_bug_chasers/Pages/MainPage.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Journal.ly';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: const WelcomePage(),
      theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  final bool _isLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoggedIn ? const MyStatefulWidget() : const WelcomeScreen(),
    );
  }
}
