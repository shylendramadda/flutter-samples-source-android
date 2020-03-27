import 'package:flutter/material.dart';

import 'home.dart';

class SampleScreen extends StatelessWidget {
  final Sample sample;

  SampleScreen({Key key, @required this.sample}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(sample.title),
        ),
        body: Center(child: Text(sample.description)));
  }
}
