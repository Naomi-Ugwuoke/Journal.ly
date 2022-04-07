import 'package:flutter/material.dart';
import 'package:the_bug_chasers/User/AppState.dart';
import 'package:provider/provider.dart';
class ProgressColumnDayWidget extends StatelessWidget {

  final Color dayColor;  

  final DateTime date;

  final bool journalAdded;

  const ProgressColumnDayWidget({ Key? key, required this.dayColor, required this.date, required this.journalAdded }) : super(key: key);  

  @override
  Widget build(BuildContext context) {

    final AppState appState = Provider.of<AppState>(context, listen: false);

    return Container(
      width: 105,
      height: 105,
      margin: const EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),      
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: journalAdded ? dayColor : const Color(0xffb6174b),        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(date.month.toString() + "/" + date.day.toString(), style: const TextStyle(color: Colors.white),),                    
          TextButton(onPressed: () {            
            appState.selectedDay = date;
            appState.visiblePageIndex = 1;
          }, child: journalAdded ? const Icon(Icons.check, size: 40, color: Colors.white,) : const Icon(Icons.add, size: 40, color: Colors.white,))
        ],  
      ),
    );
  }
}