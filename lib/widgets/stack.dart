import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack Demo')),
      body: Stack(
        children: <Widget>[
          Container(
            width: 400,
            height: 400,
            color: Colors.amberAccent,
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.pink,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.green,
          ),
          Container(
            width: 20,
            height: 20,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
