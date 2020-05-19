import 'file:///D:/Projects/Working_with_flutter/bmical/lib/screen/MyHomePage.dart';
import 'file:///D:/Projects/Working_with_flutter/bmical/lib/screen/resultPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff0A0E21),
          scaffoldBackgroundColor: Color(0xff0A0E21)),
      home: MyHomePage(),
    );
  }
}
