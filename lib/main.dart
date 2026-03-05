import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Rewards App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mobile Rewards'),
        ),
        body: Center(
          child: Text('Welcome to the Mobile Rewards App!'),
        ),
      ),
    );
  }
}