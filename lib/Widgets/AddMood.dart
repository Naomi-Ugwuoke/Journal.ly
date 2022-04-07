import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/User/AppState.dart';
import 'package:the_bug_chasers/User/Profile.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddMood extends StatefulWidget {

  bool editMode = false;
  Color updateColor;
  String colorName;

  AddMood({Key? key, required this.editMode, this.updateColor = const Color(0xff395e66), this.colorName = ''}) : super(key: key);

  @override
  State<AddMood> createState() => _AddMoodState(this.editMode, this.updateColor, this.colorName);
}

class _AddMoodState extends State<AddMood> {  

  final bool editMode;
  Color updateColor;
  String colorName;

  _AddMoodState(this.editMode,this.updateColor, this.colorName);

  late final nameController = TextEditingController(text: colorName);
  final colorController = TextEditingController();  

  Future<bool> addMood() async {
    String name = nameController.text;    
    String rgb = colorController.text;    

    if (rgb.startsWith("#")) {
      rgb = rgb.substring(1, 8);
    }

    String r = rgb[2] + rgb[3];
    String g = rgb[4] + rgb[5];
    String b = rgb[6] + rgb[7];

    final Profile profile = Provider.of<Profile>(context, listen: false);

    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    if (name.isNotEmpty && rgb.toString().isNotEmpty) {
      var newMood = {
        name: [r, g, b]
      };

      //  print(newMood);

      await users.doc(profile.userId).update({
        "Moods.$name": [r, g, b]
      }).then((value) {
        profile.moodAdded = true;
        return true;
        // return alertWidget("Mood added!", "The mood has been added to your account.");
      }).catchError((onError) {
        return false;
        // return alertWidget("Error!", onError.toString());
      });
    }

    return false;
  }

  Color pickerColor = const Color(0xff58877f);  

  void changeColor(Color color) {
    setState(() {
      updateColor = color;
    });
  }

  Widget alertWidget(String alertTitle, String alertText) {
    return AlertDialog(
      title: Text(alertTitle),
      content: Text(alertText),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'))
      ],
    );
  }

  Future<String?> dialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: editMode ? const Text('Add New Mood') : const Text('Update Mood'),
        content: SingleChildScrollView(
          child: Column(children: [
            TextFormField(
              controller: nameController,
              autofocus: true,
              enableSuggestions: true,                             
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mood Name',
                hintText: 'Enter name for your mood',                          
              ),                            
            ),
            const SizedBox(
              height: 25,
            ),
            ColorPicker(
              pickerColor: updateColor.toString().isNotEmpty ? updateColor : pickerColor,              
              onColorChanged: changeColor,
              hexInputBar: true,
              paletteType: PaletteType.hueWheel,                                                
              hexInputController: colorController,
            )
          ]),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel')),
          ElevatedButton(
              onPressed: () async {
                await addMood();
                Navigator.of(context).pop();
              },
              child: editMode ? const Text('Update Mood') : const Text('Add Mood'))
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return editMode ? TextButton(
      onPressed: () { 
        dialog(context);
      }, 
      child: const Icon(Icons.edit, color: Color(0xff3b3b58),)
    ) : ElevatedButton(onPressed: () {
        dialog(context);
      }, 
    child: const Text('Add New'));
  }
}
