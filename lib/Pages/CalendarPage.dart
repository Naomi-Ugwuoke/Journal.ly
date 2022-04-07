import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:the_bug_chasers/Pages/JournalPage.dart';
import 'package:the_bug_chasers/User/AppState.dart';
import 'package:the_bug_chasers/providers/DayColorProvider.dart';
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
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.disabled;

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

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder:
          (final BuildContext context, final AppState appState, final child) {
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
                focusedDay: appState.focusedDay,
                headerVisible: true,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                ),
                calendarFormat: _calendarFormat,
                rangeSelectionMode: _rangeSelectionMode,
                onDaySelected: _onDaySelected,
                onCalendarCreated: (controller) => _pageController = controller,
                onPageChanged: _onFocusedDayChanged,
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
                      padding: const EdgeInsets.all(0.5),
                      alignment: Alignment.center,
                      decoration: getDecoration(day, focusedDay),
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
      },
    );
  }

  getDecoration(DateTime day, focusedDay) {
    var today = DateTime.now();
    if (day.day != today.day ||
        day.year != today.year ||
        day.month != today.month) {
      return BoxDecoration(color: getColorForDay(day, focusedDay));
    }

    return BoxDecoration(
        border: Border.all(width: 4, color: Colors.amber),
        color: getColorForDay(day, focusedDay));
  }

  getColorForDay(DateTime day, DateTime focusedDay) {
    var dayColors = provider.getDayColorMap();
    DateTime key = dayColors.keys.firstWhere(
        (x) => x.day == day.day && x.month == day.month && x.year == day.year,
        orElse: () => DateTime(0));

    Color color = dayColors[key] ?? DEFAULT_COLOR;

    var alpha = day.month == focusedDay.month ? 148 : 48;
    return color.withAlpha(alpha);
  }

  void _onFocusedDayChanged(DateTime focusedDay) {
    final AppState appState = Provider.of<AppState>(context, listen: false);
    appState.focusedDay = focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    final AppState appState = Provider.of<AppState>(context, listen: false);
    appState.selectedDay = selectedDay;
    appState.visiblePageIndex = 1;
  }
}
