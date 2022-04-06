import 'package:flutter/material.dart';

class JournalPage extends StatelessWidget {
  const JournalPage(DateTime focusedDay, {Key? key, required this.title})
      : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}


/*import 'package:flutter/material.dart';

import '../main.dart';

class JournalPage extends StatelessWidget {
  JournalPage(param0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xff),
          scaffoldBackgroundColor: Color(0xff2B2D2D)),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String input = "";
  // List entry = List();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Journal Page",
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontStyle: FontStyle.italic,
              letterSpacing: 5,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.red[500],
            size: 35,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Add an entry"),
                    content: TextField(
                      decoration:
                          InputDecoration(hintText: "How was your day?"),
                      onChanged: (String value) {},
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}

*/





/*import 'package:flutter/material.dart';

class JournalPage extends StatelessWidget {
  final DateTime? selectedDay;
  const JournalPage(this.selectedDay, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateToOpen = selectedDay ?? DateTime.now();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Journal Page'),
          centerTitle: true,
          backgroundColor: const Color(0xff28587b),
        ),
      ),
    );
  }
}*/
