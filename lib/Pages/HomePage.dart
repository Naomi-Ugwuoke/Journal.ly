import 'package:flutter/material.dart';
import 'package:the_bug_chasers/Widgets/DailyJournalProgressCard.dart';
import 'package:the_bug_chasers/Widgets/UsersMoods.dart';
import 'package:the_bug_chasers/Widgets/emailNotVerified.dart';
import 'package:the_bug_chasers/Widgets/progress_column.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/User/Profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final Color _themeColor =const Color(0xff3b3b58);

  @override
  Widget build(BuildContext context) {
    return Consumer<Profile>(
      builder: (context, Profile profile, child) {
        return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          backgroundColor: _themeColor,
          ),      
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // if(!profile.isVerified) const EmailNotVerified(),
                  Text('Welcome, \n' + profile.userName!, style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                  const SizedBox(height: 30,),
                  const ProgressColumn(),
                  const SizedBox(height: 20,),
                  DailyJournalProgressCard(themeColor: _themeColor),
                  const SizedBox(height: 20,),
                  // UsersMoods(profile:profile)
                ],
              )
            ),
          )
        );
      },
    ); 
  }
}
