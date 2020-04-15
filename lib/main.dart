import 'package:flutter/material.dart';
import './logic/locator.dart';
import './ui/screens/home/home.dart';

void main() {
  setUp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xfff263238),
        primaryColorLight: Color(0xfffe1e2e1),
      ),
      debugShowCheckedModeBanner: false,
      home: PostScreen(),
    );
  }
}
