import 'package:flutter/material.dart';
import 'package:fluttersamples/code.dart';
import 'package:fluttersamples/output.dart';

import 'home.dart';

class SampleScreen extends StatefulWidget {
  final Sample sample;
  int selectedIndex = 0;
  TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  SampleScreen({Key key, @required this.sample}) : super(key: key);

  @override
  State<SampleScreen> createState() {
    return SampleScreenState();
  }
}

class SampleScreenState extends State<SampleScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      OutputWidget(sample: widget.sample),
      CodeWidget(sample: widget.sample),
    ];
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.sample.title),
      ),
      body: children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.mobile_screen_share),
            title: Text('Output'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            title: Text('Code'),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
