import 'package:flutter/material.dart';

import './pages/home.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}
// void main() => runApp(MyApp());

//stateful widget requires createState()
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown,
        brightness: Brightness.dark,
        accentColor:Colors.indigo
      ),
      //scaffold createes the things u want to see on the page
      home: HomePage()
    );
  }
}
