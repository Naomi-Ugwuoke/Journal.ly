import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "What are you thinking?",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey[900],
                borderRadius: BorderRadius.circular(8.0)),
            child: Image.asset(
              "images/download.jpg",
              fit: BoxFit.contain,
            ),
            height: 45,
            width: 45,
          )
        ],
      ),
    );
  }
}
