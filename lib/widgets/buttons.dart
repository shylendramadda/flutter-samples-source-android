import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Button Demo"),
        ),
        body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                      child: Text('Flat Button',
                          style: TextStyle(fontSize: 20, color: Colors.blue)),
                      onPressed: () {}),
                  SizedBox(height: 20), // for add space
                  IconButton(
                      icon: Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.red,
                        size: 36,
                      ),
                      tooltip: 'Image Button',
                      onPressed: () {}),
                  SizedBox(height: 20),
                  RaisedButton(
                    child:
                        Text('Disabled Button', style: TextStyle(fontSize: 20)),
                    onPressed: null,
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                      child: const Text('Enabled Button',
                          style: TextStyle(fontSize: 20)),
                      onPressed: () {}),
                  SizedBox(height: 20),
                  RaisedButton(
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('Gradient Button',
                            style: TextStyle(fontSize: 20)),
                      ),
                      onPressed: () {}),
                  SizedBox(height: 20),
                  FloatingActionButton.extended(
                      label: Text('Floating Action Button'),
                      icon: Icon(Icons.thumb_up),
                      backgroundColor: Colors.blue,
                      onPressed: () {}),
                  SizedBox(height: 20),
                  OutlineButton(
                      child: new Text("Outline Button"),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {})
                ],
              ),
            ),
          ],
        ));
  }
}
