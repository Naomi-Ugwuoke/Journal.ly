import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/providers/dayColorProvider.dart';

class AppState extends ChangeNotifier {

  int _visiblePageIndex = 0;

  late DateTime? _selectedDay = DateTime.now();

  bool _moodAdded = false;

  late DayColorProvider _provider;

  DayColorProvider get provider {
    return _provider;
  }

  set provider(DayColorProvider providerArg) {
    _provider = providerArg;
  }

  int get visiblePageIndex {
    return _visiblePageIndex;
  }

  DateTime? get selectedDay {
    return _selectedDay;
  }

  set selectedDay(DateTime? dateTime) {
    _selectedDay = dateTime;
    notifyListeners();
  }

  set visiblePageIndex(int index) {
    _visiblePageIndex = index;
    notifyListeners();
  }

  void setIndex(int index) {
    _visiblePageIndex = index;
    notifyListeners();
  }

  bool get moodAdded {
    return _moodAdded;
  }

  set moodAdded(bool val) {
    _moodAdded = val;
    notifyListeners();
  }

}