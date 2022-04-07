import 'package:flutter/material.dart';

class Product {
  final String title, desc;
  final Color color;
  Product({
    required this.title,
    required this.desc,
    required this.color,
  });
}

List<Product> products = [
  Product(
    title: "Health",
    desc: "Loren ipsum",
    color: Color(0xFF71b8ff),
  ),
  Product(
    title: "Team Metting",
    desc: "Loren ipsum",
    color: Color(0xFFffaa5b),
  ),
  Product(
    title: "Food",
    desc: "Loren ipsum",
    color: Color(0xFF9ba0fc),
  ),
];
