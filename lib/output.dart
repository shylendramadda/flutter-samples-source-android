import 'package:FlutterSamples/appbar.dart';
import 'package:FlutterSamples/drawer.dart';
import 'package:FlutterSamples/gallary.dart';
import 'package:FlutterSamples/silverappbar.dart';
import 'package:FlutterSamples/splash.dart';
import 'package:FlutterSamples/tabbar.dart';
import 'package:FlutterSamples/todo.dart';
import 'package:flutter/material.dart';

import 'bottomnav.dart';
import 'home.dart';
import 'homesample.dart';
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
      case 4:
        {
          screenName = GalleryScreen();
          break;
        }
      case 5:
        {
          screenName = HomeSample();
          break;
        }
      case 6:
        {
          screenName = DrawerScreen();
        }
        break;
      case 7:
        {
          screenName = AppBarScreen();
        }
        break;
      case 8:
        {
          screenName = BottomNavigationScreen();
        }
        break;
      case 9:
        {
          screenName = SliverAppBarScreen();
        }
        break;
      case 10:
        {
          screenName = TabBarClass();
        }
        break;
    }
    return screenName;
  }
}
