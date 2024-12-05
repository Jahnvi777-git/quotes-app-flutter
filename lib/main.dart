import 'package:flutter/material.dart';
import 'intro_screen.dart'; // Ensure the intro_screen.dart file is in the right directory

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inspirational Quotes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: IntroScreen(), // Show IntroScreen as the starting screen
    );
  }
}
