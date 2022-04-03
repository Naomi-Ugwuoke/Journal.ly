// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:the_bug_chasers/Pages/AccountSettings.dart';
import 'package:the_bug_chasers/Pages/JournalSettings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  final Color _themeColor =const Color(0xff3b3b58);

  @override
  Widget build(BuildContext context) {

    const Color _themeColor =  Color(0xff3b3b58);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
          backgroundColor: _themeColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Card(
                  color: const Color(0xfffefefe),
                  child: Padding( 
                    padding: const EdgeInsets.all(8),
                    child:
                      Column(
                      children: const [
                        CircleAvatar(
                          backgroundImage: AssetImage('imgs/user-image.png'),
                          minRadius: 75.0,
                          ),
                        Text('Aarushi Avarsekar', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center, ), 
                        Text('AarushiSundeep.Avarsekar@student.ufv.ca', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                      ],
                    ),
                  )
                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                      ListTile(
                        title: const Text('Account Settings'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));      
                        },
                      ), 
                      ListTile(
                        title: const Text('Journal Settings'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const JournalSettings()));      
                        },
                      ),
                      ListTile(
                        title: const Text('Moods Settings'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const JournalSettings()));      
                        },
                      ),
                      ListTile(
                        title: const Text('Help'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));      
                        },
                      ),
                      ListTile(
                        title: const Text('Logout'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));      
                        },
                      ),
                    ] 
                  ),
                )
                
            ]),
        )

    );
  }
}
