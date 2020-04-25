import 'package:flutter/material.dart';

class AppInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Flutter Samples - App Info")),
        body: Container(
          color: Colors.blue,
          child: ListView(
            padding: const EdgeInsets.all(30),
            children: <Widget>[
              Image.asset('assets/images/flutter_icon.png',
                  width: 150, height: 80),
              SizedBox(width: 50),
              Text('Flutter Samples',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(width: 20),
              Text('Version 1.0.3',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                    ('This app is basically to learn Flutter Widgets and Samples with souce code. More samples will be updated.')),
              )
            ],
          ),
        ));
  }
}
