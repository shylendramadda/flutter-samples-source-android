import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => HomeScreen(),
      '/SplashScreen': (BuildContext context) => SplashScreen(),
      '/LoginScreen': (BuildContext context) => LoginScreen()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/flutter_icon.png',
            width: 300, height: 200),
      ),
    );
  }
}
// Release version 1.0.0 in play store
