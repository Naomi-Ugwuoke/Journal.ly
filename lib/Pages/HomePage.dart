import 'package:flutter/material.dart';
import 'package:the_bug_chasers/Widgets/progress_column.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          backgroundColor: const Color(0xff2c4251),
      ),      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('Welcome, \nIshan', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
            SizedBox(height: 30,),
            ProgressColumn(),
            SizedBox(height: 30,)
          ],
      )),
    );
  }
}
