import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:the_bug_chasers/Pages/CalendarPage.dart';
import 'package:the_bug_chasers/Pages/HomePage.dart';
import 'package:the_bug_chasers/Pages/JournalPage.dart';
import 'package:the_bug_chasers/Pages/LoginPage.dart';
import 'package:the_bug_chasers/Pages/SettingsPage.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      home: const MyStatefulWidget()      
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;  

  bool _loggedIn = true;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    JournalPage(),
    CalendarPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loggedIn ? Scaffold(      
      body: Center(        
        child: _widgetOptions.elementAt(_selectedIndex),
      ),      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_view_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    ) : const LoginPage();
  }
}
