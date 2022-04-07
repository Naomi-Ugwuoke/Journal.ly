import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

import 'journal/AppBar.dart';
import 'journal/ListData.dart';
import 'journal/listButton.dart';
import 'journal/customBar.dart';
import 'journal/model/listModel.dart';
import 'journal/search.dart';

class JournalPage extends StatefulWidget {
  final DateTime? focusedDay;
  const JournalPage(this.focusedDay, {Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<JournalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const CustomBottomBar(),
        body: SafeArea(
            child: ListView(
          children: const [
            //navigation bar
            CustomAppBar(),
            SearchBar(),
            ListButtonContainer(),

            //creating notes

            ListData(),
          ],
        )));
  }
}














/*import 'package:flutter/material.dart';

class JournalPage extends StatelessWidget {
  const JournalPage(param0);

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
  //List entry = List();
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
  // final DateTime? selectedDay;
  // const JournalPage(this.selectedDay, {Key? key}) : super(key: key);

  const JournalPage( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final AppState appState = Provider.of<AppState>(context, listen: false);

    DateTime dateToOpen = appState.selectedDay ?? DateTime.now();    

    return  Scaffold(
        appBar: AppBar(
          title: const Text('Journal Page'),
          centerTitle: true,
          backgroundColor: const Color(0xff28587b),
        ),      
    );
  }
}*/
