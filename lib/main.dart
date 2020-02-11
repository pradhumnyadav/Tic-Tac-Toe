import 'package:flutter/material.dart';
import 'package:new_app/home_page.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      home: new HomePage(),
    );
  }
}