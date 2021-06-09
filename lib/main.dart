import 'package:flutter/material.dart';
import 'package:xcelpros/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XcelPros',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: LoginScreen(),
    );
  }
}
