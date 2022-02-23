import 'package:flutter/material.dart';
import 'package:flutter_online_learning_app/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Learning',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: HomeScreen(),
    );
  }
}
