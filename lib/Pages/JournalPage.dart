import 'package:flutter/material.dart';
import 'package:the_bug_chasers/User/AppState.dart';
import 'package:provider/provider.dart';

class JournalPage extends StatelessWidget {
  // final DateTime? selectedDay;
  // const JournalPage(this.selectedDay, {Key? key}) : super(key: key);

  const JournalPage( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final AppState appState = Provider.of<AppState>(context, listen: false);

    DateTime dateToOpen = appState.selectedDay ?? DateTime.now();    

    return  Scaffold(
        appBar: AppBar(
          title: const Text('Journal Page'),
          centerTitle: true,
          backgroundColor: const Color(0xff28587b),
        ),      
    );
  }
}
