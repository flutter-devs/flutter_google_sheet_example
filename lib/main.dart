import 'package:flutter/material.dart';
import 'home.dart';
import 'monument_model.dart';

void main() {
  runApp(
    MyApp(),
  );
}

MonumentModel monumentModel = MonumentModel();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(monuments: fetchMonument()),
    );
  }
}
