import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/Pages/CalendarPage.dart';
import 'package:the_bug_chasers/Pages/HomePage.dart';
import 'package:the_bug_chasers/Pages/JournalPage.dart';
import 'package:the_bug_chasers/Pages/SettingsPage.dart';
import 'package:the_bug_chasers/providers/dayColorProvider.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const String uid = 'Q4hNhfhskzTAfSFnaaXQaEYlp9E3';
  static final _dayColorProvider = DayColorProvider(uid: uid);

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const JournalPage(null),
    CalendarPage(provider: _dayColorProvider),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
