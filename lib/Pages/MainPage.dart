import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/Pages/CalendarPage.dart';
import 'package:the_bug_chasers/Pages/HomePage.dart';
import 'package:the_bug_chasers/Pages/JournalPage.dart';
import 'package:the_bug_chasers/Pages/SettingsPage.dart';
import 'package:the_bug_chasers/User/AppState.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/providers/dayColorProvider.dart';
import 'package:the_bug_chasers/User/Profile.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  // final Profile profile = Provider.of<Profile>(context, listen: false);

  // static const String uid = profile.userId;
  // static final _dayColorProvider = DayColorProvider(uid: uid);

  // static final List<Widget> _widgetOptions = <Widget>[
  //   const HomePage(),
  //   const JournalPage(null),
  //   CalendarPage(provider: _dayColorProvider),
  //   const SettingsPage(),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  void _onItemTapped(int index) {
    final AppState appState = Provider.of<AppState>(context, listen: false);      
    appState.visiblePageIndex = index;           
  }

  @override
  Widget build(BuildContext context) {    

    final Profile profile = Provider.of<Profile>(context, listen: false);

    String uid = profile.userId;
    final _dayColorProvider = DayColorProvider(uid: uid);

    final List<Widget> _widgetOptions = <Widget>[
      const HomePage(),
      const JournalPage(),
      CalendarPage(provider: _dayColorProvider),
      const SettingsPage(),
    ];    

    return Consumer<AppState>(
      builder: (final BuildContext context, final AppState appState, final child  ) {
        return Scaffold(      
      body: Center(        
        child: _widgetOptions.elementAt(appState.visiblePageIndex),
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
        currentIndex: appState.visiblePageIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
      },); 
  }
}
