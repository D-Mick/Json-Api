import 'package:flutter/material.dart';
import 'package:json_app/home_page.dart';

void main() =>runApp(Json());

class Json extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}
