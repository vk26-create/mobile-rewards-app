import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'User Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Current Points: 100',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Available Tasks:',
              style: TextStyle(fontSize: 18),
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(title: Text('Task 1')),  
                ListTile(title: Text('Task 2')),  
                ListTile(title: Text('Task 3')),  
              ],
            )
          ],
        ),
      ),
    );
  }
}
