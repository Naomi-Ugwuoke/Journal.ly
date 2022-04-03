import 'package:flutter/material.dart';

class JournalSettings extends StatefulWidget {
  const JournalSettings({ Key? key }) : super(key: key);

  @override
  State<JournalSettings> createState() => _JournalSettingsState();
}

class _JournalSettingsState extends State<JournalSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal Settings'),
        centerTitle: true,
        backgroundColor: const Color(0xff006e90),
      ),
     body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Expanded(
                  child: ListView(
        
                  children: <Widget>[
                      ListTile(
                        title: const Text('Colour Options'),
                        onTap: () {
                              
                        },
                      ),
                      ListTile(
                        title: const Text('Diary Name'),
                        onTap: () {
                        },
                      ),
                      const Divider(color: Color(0xffcecece)),
                      
                    ] 
                  ),
                )
      ),
    );
  }
}