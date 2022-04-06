import 'package:flutter/material.dart';
import 'package:the_bug_chasers/Widgets/progress_column_day_widget.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/User/AppState.dart';
import 'package:the_bug_chasers/User/Profile.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_bug_chasers/providers/dayColorProvider.dart';

import '../Pages/CalendarPage.dart';

class ProgressColumn extends StatefulWidget {
  const ProgressColumn({Key? key}) : super(key: key);

  @override
  State<ProgressColumn> createState() => _ProgressColumnState();
}

class _ProgressColumnState extends State<ProgressColumn> { 

  @override
  Widget build(BuildContext context) {

    final Profile profile = Provider.of<Profile>(context, listen: false);
    final DayColorProvider provider = DayColorProvider(uid: profile.userId);

    const Color _themeColor =const Color(0xff3b3b58);   

    DateTime today = DateTime.now();
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
    DateTime dayBefore = DateTime.now().subtract(const Duration(days: 2));

    // Map<DateTime, Object> daysWithMoods = <DateTime, Object>{};

    getMoodandProgress(DateTime date) {

      // Map<DateTime, Object> newMap = <DateTime, Object>{};
      var dayColors = provider.getDayColorMap();
      DateTime key = dayColors.keys.firstWhere(
        (x) => x.day == date.day && x.month == date.month && x.year == date.year,
        orElse: () => date);

      Color color = _themeColor;

      color = dayColors[key] ?? _themeColor;

      // newMap[key] =  {
      //   "color": color,
      //   "journalAdded": color == _themeColor ? false : true
      // };

      // print([key, color, color == _themeColor ? false : true]);

      // daysWithMoods.addAll(newMap);
      return [key, color, color == _themeColor ? false : true];
    }

    return Container(      
      height: 190,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1, color: const Color(0xffeeeeee)),        
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4.0, offset: Offset(2, 3))]
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text('Progress', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [              
                    ProgressColumnDayWidget(dayColor: getMoodandProgress(today)[1] as Color, date: getMoodandProgress(today)[0] as DateTime, journalAdded: getMoodandProgress(today)[2] as bool,),              
                    ProgressColumnDayWidget(dayColor: getMoodandProgress(yesterday)[1] as Color, date: getMoodandProgress(yesterday)[0] as DateTime, journalAdded: getMoodandProgress(yesterday)[2] as bool,),              
                    ProgressColumnDayWidget(dayColor: getMoodandProgress(dayBefore)[1] as Color, date: getMoodandProgress(dayBefore)[0] as DateTime, journalAdded: getMoodandProgress(dayBefore)[2] as bool,),              
                    // ProgressColumnDayWidget(dayColor: _themeColor, date: DateTime.now().subtract(const Duration(days: 1)), journalAdded: false,),              
                    // ProgressColumnDayWidget(dayColor: _themeColor, date: DateTime.now().subtract(const Duration(days: 2)), journalAdded: true,),              
                  ]
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 36,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xfff0Edee),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
            ),
          child: InkWell(
              child: const Text(
                'View All ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalendarPage(
                        provider: DayColorProvider(
                            uid: profile.userId),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}