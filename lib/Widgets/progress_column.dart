import 'package:flutter/material.dart';
import 'package:the_bug_chasers/Pages/CalendarPage.dart';
import 'package:the_bug_chasers/Widgets/progress_column_day_widget.dart';

class ProgressColumn extends StatefulWidget {
  const ProgressColumn({ Key? key }) : super(key: key);

  @override
  State<ProgressColumn> createState() => _ProgressColumnState();
}

class _ProgressColumnState extends State<ProgressColumn> {
  @override
  Widget build(BuildContext context) {
    return Container(      
      height: 190,
      decoration: BoxDecoration(
        color: const Color(0xffefefef),
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
                  children: const [              
                    ProgressColumnDayWidget(dayColor: Color(0xfffefefe)),              
                    ProgressColumnDayWidget(dayColor: Color(0xff788aa3)),              
                    ProgressColumnDayWidget(dayColor: Color(0xff7d84b2)),              
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
              color: Color(0xffcecece),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
            ),
            child: InkWell(
              child: const Text('View All ', style: TextStyle(fontWeight: FontWeight.bold),) ,
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const CalendarPage(),)
                );
              },
            )
          )
        ],
      ),
    );
  }
}