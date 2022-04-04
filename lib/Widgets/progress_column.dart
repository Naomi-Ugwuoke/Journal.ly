import 'package:flutter/material.dart';
import 'package:the_bug_chasers/Widgets/progress_column_day_widget.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/User/AppState.dart';
import 'package:the_bug_chasers/User/Profile.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProgressColumn extends StatefulWidget {
  const ProgressColumn({ Key? key }) : super(key: key);

  @override
  State<ProgressColumn> createState() => _ProgressColumnState();
}

class _ProgressColumnState extends State<ProgressColumn> {
  @override
  Widget build(BuildContext context) {

    final Profile profile = Provider.of<Profile>(context, listen: false);
    

    return Container(      
      height: 190,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        border: Border.all(width: 1, color: const Color(0xffeeeeee)),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                  child: Text('Progress', style: TextStyle(fontSize: 18), textAlign: TextAlign.left,),
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [              
                    ProgressColumnDayWidget(dayColor: const Color(0xffcccccc), date: DateTime.now(),),              
                    ProgressColumnDayWidget(dayColor: const Color(0xff788aa3), date: DateTime.now(),),              
                    ProgressColumnDayWidget(dayColor: const Color(0xff7d84b2), date: DateTime.now(),),              
                  ]
                ),
              ],
            ),
          ),    
          const SizedBox(height: 5,),
          Container(
            width: double.infinity,
            height: 36,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xfff0Edee),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
            ),
            child: InkWell(
              child: const Text('View All ', style: TextStyle(fontWeight: FontWeight.bold),) ,
              onTap: () {
                final AppState appState = Provider.of<AppState>(context, listen: false);
                appState.visiblePageIndex = 2;
              },
            )
          )
        ],
      ),
    );
  }
}