import 'package:flutter/material.dart';

class ProgressColumnDayWidget extends StatelessWidget {

  final Color dayColor;  

  const ProgressColumnDayWidget({ Key? key, required this.dayColor }) : super(key: key);
  

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
          Text(DateTime.now().month.toString() + "/" + DateTime.now().day.toString()),          
          const SizedBox(height: 5),
          const Icon(Icons.check, size: 40,)
        ],  
      ),
    );
  }
}