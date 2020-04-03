import 'package:flutter/material.dart';
import 'package:fluttersamples/splash.dart';
import 'package:fluttersamples/todo.dart';

import 'home.dart';
import 'login.dart';

class OutputWidget extends StatefulWidget {
  final Sample sample;

  OutputWidget({Key key, @required this.sample}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OutputState();
  }
}

class OutputState extends State<OutputWidget> {
  Object screenName;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Scaffold(
          body: Center(child: loadPreview(context)),
        ));
  }

  Object loadPreview(BuildContext context) {
    switch (widget.sample.id) {
      case 1:
        {
          screenName = SplashScreen();
          break;
        }
      case 2:
        {
          screenName = LoginScreen();
          break;
        }
      case 3:
        {
          screenName = TodoScreen();
          break;
        }
    }
    return screenName;
  }
}
