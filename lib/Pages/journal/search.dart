import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        //padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: TextFormField(
          decoration: const InputDecoration(
              hintText: "Search your entries",
              prefixIcon: Icon(Icons.search),
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              )),
        ),
      ),
    );
  }
}
