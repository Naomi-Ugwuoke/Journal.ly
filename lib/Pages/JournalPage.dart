import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

import 'journal/AppBar.dart';
import 'journal/listButton.dart';
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
        body: SafeArea(
            child: ListView(
          children: [
            //navigation bar
            const CustomAppBar(),
            const SearchBar(),
            const ListButtonContainer(),

            //creating notes

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    //childAspectRatio: 0.80,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (context, index) => ListCard(
                        product: products[index],
                        press: () {},
                      )),
            ),
          ],
        )));
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  final Product product;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: product.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Text(
              products[0].title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 19,
              ),
            ),
            Text(
              products[0].desc,
              maxLines: 5,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
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
