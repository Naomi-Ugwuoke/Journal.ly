import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/User/AppState.dart';
import 'package:the_bug_chasers/User/Profile.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddMood extends StatefulWidget {
  const AddMood({Key? key}) : super(key: key);

  @override
  State<AddMood> createState() => _AddMoodState();
}

class _AddMoodState extends State<AddMood> {
  final nameController = TextEditingController();
  final colorController = TextEditingController();

  Future<bool> addMood() async {
    String name = nameController.text;
    // Color color = chosenColor;
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
  Color chosenColor = const Color(0xff395e66);

  void changeColor(Color color) {
    setState(() {
      chosenColor = color;
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

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text('Add New Mood'),
                  content: SingleChildScrollView(
                    child: Column(children: [
                      TextFormField(
                        controller: nameController,
                        autofocus: true,
                        enableSuggestions: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Mood Name',
                            hintText: 'Enter name for your mood'),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ColorPicker(
                        pickerColor: pickerColor,
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
                        child: const Text('Add Mood'))
                  ],
                )),
        child: const Text('Add New'));
  }
}
