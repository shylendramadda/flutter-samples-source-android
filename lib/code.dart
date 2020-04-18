import 'package:flutter/material.dart';

import 'home.dart';

class CodeWidget extends StatelessWidget {
  final Sample sample;

  CodeWidget({Key key, @required this.sample}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Padding(
      padding: const EdgeInsets.all(20),
      child: SelectableText(sample.sourceCode,
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
    )));
  }
}
