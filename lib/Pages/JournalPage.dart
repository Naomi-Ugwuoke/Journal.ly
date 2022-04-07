import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/User/AppState.dart';
import 'package:the_bug_chasers/Utils/DatabaseUtils.dart';
import 'package:the_bug_chasers/providers/DayColorProvider.dart';

import '../User/Profile.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<JournalPage> createState() => _JournalPage();
}

class _JournalPage extends State<JournalPage> {
  _JournalPage();

  Future<void> _openCalendar(BuildContext context) async {
    final AppState appState = Provider.of<AppState>(context, listen: false);
    appState.focusedDay = appState.selectedDay;
    appState.visiblePageIndex = 2;
  }

  Future<void> _handleTextSubmitted(String userTextInput) async {
    final AppState appState = Provider.of<AppState>(context, listen: false);
    final Profile profile = Provider.of<Profile>(context, listen: false);

    DocumentReference? docRef =
        await getOrCreateJournalRef(profile.userId, appState.selectedDay);
    docRef!.update({'Text': userTextInput});
  }

  Future<void> _handleMoodChanged(String? mood) async {
    final AppState appState = Provider.of<AppState>(context, listen: false);
    final Profile profile = Provider.of<Profile>(context, listen: false);

    setState(() {
      dropdownValue = mood;
    });

    DocumentReference? docRef =
        await getOrCreateJournalRef(profile.userId, appState.selectedDay);
    docRef!.update({'Mood': mood});
  }

  _getDropDownItems() async {
    final Profile profile = Provider.of<Profile>(context, listen: false);
    DayColorProvider provider = DayColorProvider(uid: profile.userId);
    List<String> moods = provider.getUserMoods();

    List<DropdownMenuItem<String>> moodItems = moods
        .map<DropdownMenuItem<String>>(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ),
        )
        .toList();
    _dropDownItems = moodItems;
  }

  getJournalText() {}

  List<DropdownMenuItem<String>> _dropDownItems = [];
  String? dropdownValue;

  bool firstBuild = true;

  @override
  Widget build(BuildContext context) {
    final Profile profile = Provider.of<Profile>(context, listen: false);
    final AppState appState = Provider.of<AppState>(context, listen: false);
    var provider = DayColorProvider(uid: profile.userId);
    _getDropDownItems();

    if (firstBuild) {
      dropdownValue = provider.getMoodForDay(appState.selectedDay);
    }

    return Consumer<AppState>(
      builder:
          (final BuildContext context, final AppState appState, final child) {
        return Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  title: ElevatedButton(
                    onPressed: () => _openCalendar(context),
                    child: Text(
                      DateFormat("MMMM d, yyyy").format(appState.selectedDay),
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 35, 83, 120)),
                  ),
                  centerTitle: false,
                  titleSpacing: 0.0,
                  backgroundColor: const Color.fromARGB(255, 40, 88, 123),
                ),
                body: Container(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    children: [
                      DropdownButton(
                        value: dropdownValue,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        hint: const Text("Mood"),
                        onChanged: _handleMoodChanged,
                        items: _dropDownItems,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        reverse: true,
                        child: TextField(
                          controller:
                              TextEditingController(text: getJournalText()),
                          keyboardType: TextInputType.multiline,
                          minLines: 28,
                          maxLines: null, //grow automatically
                          onChanged: (strInput) =>
                              _handleTextSubmitted(strInput),
                          decoration: InputDecoration(
                            hintText: 'Create a journal entry..',
                            contentPadding: const EdgeInsets.only(
                                left: 10, right: 10, top: 20, bottom: 30),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
