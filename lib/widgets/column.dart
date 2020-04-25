import 'package:flutter/material.dart';

class ColumnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Column Demo')),
      body: Center(
          child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            color: Colors.blue[50],
            child: Text('Item1', textAlign: TextAlign.center),
          )),
          Expanded(
              child: Container(
            color: Colors.red[50],
            child: Text('Item2', textAlign: TextAlign.center),
          )),
          Expanded(
            child: Container(
                color: Colors.green[50],
                child: FittedBox(
                  fit: BoxFit.contain, // otherwise the logo will be tiny
                  child: const FlutterLogo(),
                )),
          ),
        ],
      )),
    );
  }
}
