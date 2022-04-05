import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:the_bug_chasers/Pages/JournalPage.dart';
import 'package:the_bug_chasers/User/AppState.dart';
import 'package:the_bug_chasers/providers/dayColorProvider.dart';
import '../Utils/DatabaseUtils.dart';
import '../Utils/CalendarUtils.dart';

import 'package:provider/provider.dart';
import 'package:the_bug_chasers/User/AppState.dart';

class CalendarPage extends StatefulWidget {
  final DayColorProvider provider;
  const CalendarPage({required this.provider, Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState(provider: provider);
}

class _CalendarPageState extends State<CalendarPage> {
  final DayColorProvider provider;
  _CalendarPageState({required this.provider});

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final PageController _pageController;

  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.disabled;

  Map<DateTime, Color> _dayColors = {};
  Color DEFAULT_COLOR = Colors.grey.withAlpha(148);

  @override
  void initState() {
    //loadDayColorMap();
    super.initState();
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    super.dispose();
  }

  // void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {

  //   final AppState appState = Provider.of<AppState>(context, listen: false);
  //   appState.selectedDay = focusedDay;
  //   appState.visiblePageIndex = 1;
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(builder: (context) => JournalPage(focusedDay)),
  //   // );
  // }

  @override
  Widget build(BuildContext context) {

    void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {

      final AppState appState = Provider.of<AppState>(context, listen: false);
      appState.selectedDay = focusedDay;
      appState.visiblePageIndex = 1;
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => JournalPage(focusedDay)),
      // );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        centerTitle: true,
        backgroundColor: const Color(0xff28587b),
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
                  color: getColorForDay(day, focusedDay),
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

  // loadDayColorMap() async {
  //   var dayColorMap = await getDayColorMap(userID, DEFAULT_COLOR);
  //   setState(() {
  //     _dayColors = dayColorMap;
  //   });
  // }

  getColorForDay(DateTime day, DateTime focusedDay) {
    var dayColors = provider.getDayColorMap();
    DateTime key = dayColors.keys.firstWhere(
        (x) => x.day == day.day && x.month == day.month && x.year == day.year,
        orElse: () => DateTime(0));

    Color color = DEFAULT_COLOR;

    color = dayColors[key] ?? DEFAULT_COLOR;

    var alpha = day.month == focusedDay.month ? 148 : 48;
    return color.withAlpha(alpha);
  }
}
