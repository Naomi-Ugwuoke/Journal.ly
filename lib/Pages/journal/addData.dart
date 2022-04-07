import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //return navigation bar
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 52, 57, 115),
        elevation: 0,
        actionsIconTheme: const IconThemeData(color: Colors.black),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Column(children: [
          //starting words
          TextFormField(
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
            decoration: const InputDecoration(
                hintText: "Title",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            decoration: const InputDecoration(
                hintText: "What's on your mind...",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                )),
          ),
        ]),
      ),
    );
  }
}
