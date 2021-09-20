import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/screens/home_screen.dart';
import 'package:flutter_netflix_responsive_ui/screens/nav_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Netflix UI',
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryColorLight: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NavScreen(),
    );
  }
}
