import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rewards Dashboard'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Rewards Dashboard!\n\nKeep track of your rewards and progress.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}