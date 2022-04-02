import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:the_bug_chasers/Pages/JournalPage.dart';

import '../utils/CalendarUtils.dart';

class CalendarPage extends StatefulWidget {
  final String userID;
  const CalendarPage({required this.userID, Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState(userID: userID);
}

class _CalendarPageState extends State<CalendarPage> {
  final String userID;
  _CalendarPageState({required this.userID});

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final PageController _pageController;

  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.disabled;

  Map<String, Color> _moodColors = {};
  Color DEFAULT_COLOR = Colors.grey;

  @override
  void initState() {
    getMoodColorMap();
    super.initState();
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JournalPage(focusedDay)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay.value,
            headerVisible: true,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
            ),
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            onDaySelected: _onDaySelected,
            onCalendarCreated: (controller) => _pageController = controller,
            onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() => _calendarFormat = format);
              }
            },
            calendarBuilders: CalendarBuilders(
              prioritizedBuilder: (context, day, focusedDay) {
                return Container(
                  height: 48,
                  width: 48,
                  color: getColorForDay(day, focusedDay, _moodColors),
                  padding: const EdgeInsets.all(0.5),
                  alignment: Alignment.center,
                  child: Text(day.day.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.black)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  getMoodColorMap() {
    var userCollection = firestore.collection('Users');
    userCollection.doc(userID).get().then((docSnapshot) {
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data()!;
        Map<String, dynamic> moodRGBMap = data['Moods'];

        Map<String, Color> moodColorMap = {};
        moodRGBMap.forEach((key, value) {
          moodColorMap[key] = Color.fromRGBO(value[0], value[1], value[2], 128);
        });

        setState(() {
          _moodColors = moodColorMap;
        });
      }
    });
  }

  getDayMoodMap() {
    Map<DateTime, String> dayMoodMap = new Map<DateTime, String>();
    Stream<QuerySnapshot> journals = firestore
        .collection('Users')
        .doc(userID)
        .collection('Journals')
        .snapshots();

    journals.forEach((page) {
      var pageMap = page.docs.asMap();
      var date = DateTime.parse(['Date'].toString());
      dayMoodMap[date] = pageMap['Mood'].toString();
    });
  }

  getColorForDay(
      DateTime day, DateTime focusedDay, Map<String, Color> moodColors) {
    var mood = day.day % 2 == 0 ? "Happy" : "Sad";
    var alpha = day.month == focusedDay.month ? 148 : 48;
    Color? color = moodColors[mood];
    return color?.withAlpha(alpha) ?? DEFAULT_COLOR;
  }
}
