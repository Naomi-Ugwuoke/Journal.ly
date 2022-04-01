import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/User/AppState.dart';


class DailyJournalProgressCard extends StatelessWidget {
  const DailyJournalProgressCard({ Key? key, required this.themeColor }) : super(key: key);

  final bool journalEntryMade = true;
  final Color themeColor;

  final TextStyle textColor = const TextStyle(color: Colors.white);

  Widget entryNotMade(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget> [
          ListTile(
            leading: Icon(Icons.book, size: 36, color: themeColor,),
            title: const Text('Journal for today pending!'),
            subtitle: const Text('You don\'t want to miss out, eh?')
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
                  child: Text('Write Now!', style: TextStyle(color: themeColor),))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget entryMade(BuildContext context) {
    return Card(
      color: themeColor,      
      child: Column(
        children: <Widget> [
          ListTile(            
            leading: const Icon(Icons.check, size: 36, color: Colors.white,),
            title:  Text('You did it!', style: textColor),
            subtitle: Text('We hope you feel happy now :)', style: textColor,)
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
                  child: const Text('Review Journal!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return journalEntryMade ? entryMade(context) : entryNotMade(context);
  }
}