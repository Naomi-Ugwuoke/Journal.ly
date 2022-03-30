import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppState extends ChangeNotifier {

  int _visiblePageIndex = 0;

  int get visiblePageIndex {
    return _visiblePageIndex;
  }

  set visiblePageIndex(int index) {
    _visiblePageIndex = index;
    notifyListeners();
  }

  void setIndex(int index) {
    _visiblePageIndex = index;
    notifyListeners();
  }

}