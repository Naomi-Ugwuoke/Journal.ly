import 'package:flutter/material.dart';
import 'package:the_bug_chasers/Pages/JournalPage.dart';
import 'package:the_bug_chasers/Widgets/progress_column.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/User/AppState.dart';

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
          children: <Widget>[
            const Text('Welcome, \nIshan', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
            const SizedBox(height: 30,),
            const ProgressColumn(),
            const SizedBox(height: 20,),
            Card(
              child: Column(
                children: <Widget> [
                  const ListTile(
                    leading: Icon(Icons.book),
                    title: Text('Journal for today pending!'),
                    subtitle: Text('You don\'t want to miss out, eh?')
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(                    
                      children: [
                        TextButton(                        
                          onPressed: () {
                           final AppState appState = Provider.of<AppState>(context, listen: false);
                           appState.visiblePageIndex = 1;
                          //  print(profile.visiblePageIndex);
                          }, 
                          child: const Text('Write Now!'))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
      )),
    );
  }
}
