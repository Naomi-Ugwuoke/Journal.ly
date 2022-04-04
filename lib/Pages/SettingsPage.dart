// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:the_bug_chasers/Pages/AccountSettings.dart';
import 'package:the_bug_chasers/Pages/JournalSettings.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/User/Profile.dart';
import 'package:the_bug_chasers/main.dart';

import 'package:provider/provider.dart';
import 'package:the_bug_chasers/User/Profile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  final Color _themeColor =const Color(0xff3b3b58);

  @override
  Widget build(BuildContext context) {

    const Color _themeColor =  Color(0xff3b3b58);

    return Consumer<Profile>(builder: (context, Profile profile, child) {

      void logout() {
         profile.logout();
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
      }


      return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
          backgroundColor: _themeColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Card(
                  color: const Color(0xfffefefe),
                  child: Padding( 
                    padding: const EdgeInsets.all(8),
                    child:
                      Column(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/imgs/user-image.png'),
                          minRadius: 75.0,                                                
                          ),       
                        const SizedBox(height: 5,),
                        Text(profile.name!, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center,), 
                        const SizedBox(height: 5,),
                        Text(profile.userEmail!, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                      ],
                    ),
                  )
                ),
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: ListView(                           
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.account_circle_outlined),                      
                      title: const Text('Account Settings'),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));      
                      },
                    ), 
                    const Divider(color: Color(0xffbfbfbf), thickness: 0.5),
                    ListTile(
                      leading: const Icon(Icons.book_outlined),                      
                      title: const Text('Journal Settings'),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const JournalSettings()));      
                      },
                    ),
                    const Divider(color: Color(0xffbfbfbf), thickness: 0.5),
                    ListTile(
                      leading: const Icon(Icons.emoji_emotions_outlined),                      
                      title: const Text('Moods Settings'),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const JournalSettings()));      
                      },
                    ),
                    const Divider(color: Color(0xffbfbfbf), thickness: 0.5),
                    ListTile(
                      leading: const Icon(Icons.help),                      
                      title: const Text('Help'),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));      
                      },
                    ),                    
                    ListTile(
                      // contentPadding: const EdgeInsets.all(2),
                      leading: const Icon(Icons.logout, color: Colors.white,),                      
                      title: const Text('Logout'),
                      tileColor: Colors.red,
                      textColor: Colors.white,
                      style: ListTileStyle.list,
                      onTap: () {                   
                        final Profile profile = Provider.of<Profile>(context, listen: false);
                        profile.isAuthenticated = false;
                        // profile.logout();
                        Navigator.pushReplacement(context, 
                          MaterialPageRoute(builder: (context) => const MyApp(),)
                        );                  
                      },
                    ),
                  ] 
                ),
              )
            ]
          ),
        )
      );
    });
  }
}
