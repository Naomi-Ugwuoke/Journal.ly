import 'package:flutter/material.dart';

class ProgressColumnDayWidget extends StatelessWidget {

  final Color dayColor;  

  final DateTime date;

  const ProgressColumnDayWidget({ Key? key, required this.dayColor, required this.date }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {    
    return Container(
      width: 105,
      height: 105,
      margin: const EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),      
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: dayColor,        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(date.month.toString() + "/" + date.day.toString()),          
          const SizedBox(height: 5),
          const Icon(Icons.check, size: 40,)
        ],  
      ),
    );
  }
}