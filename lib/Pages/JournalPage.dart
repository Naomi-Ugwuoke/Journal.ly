import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JournalPage extends StatefulWidget {
  final DateTime? date;

  const JournalPage({Key? key, this.date}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<JournalPage> createState() => _JournalPage(date: date);
}

class _JournalPage extends State<JournalPage> {
  DateTime journalDate = DateTime.now();

  _JournalPage({DateTime? date}) {
    if (date != null) {
      journalDate = date;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: journalDate,
        firstDate: DateTime(2000),
        lastDate: DateTime.now());
    if (newDate != null && newDate != journalDate) {
      setState(() {
        journalDate = DateTime(newDate.year, newDate.month, newDate.day);
      });
    }
  }

  Future<void> _handleTextSubmitted(String userTextInput) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text(
                  DateFormat("MMMM d, yyyy").format(journalDate),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              centerTitle: false,
              titleSpacing: 0.0,
            ),
            body: Container(
              padding: const EdgeInsets.all(7.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                reverse: true,

                // here's the actual text box
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 33,
                  maxLines: null, //grow automatically
                  onSubmitted: (strInput) => _handleTextSubmitted(strInput),
                  decoration: const InputDecoration.collapsed(
                    hintText: 'Create a journal entry..',
                  ),
                ),
                // ends the actual text box
              ),
            ),
          ),
        ),
      ),
    );
  }
}
