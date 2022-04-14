import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_bug_chasers/Utils/CalendarUtils.dart';

class DayColorProvider {
  static DayColorProvider? _dayColorProvider;

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Map<DateTime, String> _dayMoodMap = <DateTime, String>{};
  Map<String, Color> _moodColorMap = <String, Color>{};

  late String uid;

  DayColorProvider._internal({required this.uid}) {
    startListening();
  }

  factory DayColorProvider({required String uid}) {
    return _dayColorProvider ??= DayColorProvider._internal(uid: uid);
  }

  startListening() {
    listenForDayMoodMap();
    listenForMoodColorMap();
  }

  getUserMoods() {
    return _moodColorMap.keys.toList();
  }

  listenForDayMoodMap() {
    Map<DateTime, String> newMap = <DateTime, String>{};
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Journals')
        .snapshots()
        .listen((value) {
      newMap = {};
      value.docs.forEach((element) {
        var data = element.data();
        DateTime date = data['Date'].toDate();
        newMap[date] = data['Mood'].toString();
      });
      _dayMoodMap = newMap;
    });
  }

  listenForMoodColorMap() {
    Map<String, Color> newMap = {};
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .snapshots()
        .listen((doc) {
      Map<String, dynamic> data = doc.data()!;
      Map<String, dynamic> moodRGBMap = data['Moods'];

      moodRGBMap.forEach((key, value) {
        var color = '0xff' + value[0] + value[1] + value[2];
        newMap[key] = Color(int.parse(color));
      });
      _moodColorMap = newMap;
    });
  }

  getDayColorMap() {
    Map<DateTime, Color> dayColorMap = <DateTime, Color>{};
    Color defaultColor = Colors.grey;
    _dayMoodMap.forEach((key, value) {
      dayColorMap[key] = _moodColorMap[value] ?? defaultColor;
    });
    return dayColorMap;
  }

  String? getMoodForDay(DateTime day) {
    day = removeTimeFromDate(day);
    return _dayMoodMap[day];
  }

  Map<String, Color> getMoodColorMap() {
    return _moodColorMap;
  }

  Color getColorForMood(String? mood) {
    
    Color val = const Color(0xff3b3b58);

    // print(mood);

    _moodColorMap.forEach((key, value) {      
      if(key == mood) { 
        // print('here');
        val = value;        
      }
    });

    // print(val);

    return val;

  }
}
