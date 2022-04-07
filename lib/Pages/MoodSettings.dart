import 'package:flutter/material.dart';
import 'package:the_bug_chasers/Widgets/AddMood.dart';
import 'package:the_bug_chasers/Widgets/MoodContainer.dart';
import 'package:the_bug_chasers/Widgets/UsersMoods.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/User/Profile.dart';

class MoodSettingsPage extends StatefulWidget {
  const MoodSettingsPage({ Key? key }) : super(key: key);

  @override
  State<MoodSettingsPage> createState() => _MoodSettingsPageState();
}

class _MoodSettingsPageState extends State<MoodSettingsPage> {

  final Color _themeColor = const Color(0xff02394a);  

  @override
  Widget build(BuildContext context) {
    
    final Profile profile = Provider.of<Profile>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Settings'),
        centerTitle: true,
        backgroundColor: _themeColor,
      ),
      floatingActionButton: AddMood(editMode: false,),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: MoodContainer(true, _themeColor),
      ),
    );
  }
}