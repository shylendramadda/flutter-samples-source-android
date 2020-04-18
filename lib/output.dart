import 'package:FlutterSamples/samples/appbar.dart';
import 'package:FlutterSamples/samples/drawer.dart';
import 'package:FlutterSamples/samples/gallery.dart';
import 'package:FlutterSamples/samples/homesample.dart';
import 'package:FlutterSamples/samples/silverappbar.dart';
import 'package:FlutterSamples/samples/splash.dart';
import 'package:FlutterSamples/samples/tabbar.dart';
import 'package:FlutterSamples/samples/todo.dart';
import 'package:FlutterSamples/widgets/buttons.dart';
import 'package:FlutterSamples/widgets/checkbox.dart';
import 'package:FlutterSamples/widgets/dropdown.dart';
import 'package:FlutterSamples/widgets/popupmenu.dart';
import 'package:FlutterSamples/widgets/snackbar.dart';
import 'package:FlutterSamples/widgets/text.dart';
import 'package:flutter/material.dart';

import 'main/home.dart';
import 'samples/bottomnav.dart';
import 'samples/login.dart';

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
      case 11:
        {
          screenName = ButtonsScreen();
        }
        break;
      case 12:
        {
          screenName = DropDownScreen();
        }
        break;
      case 13:
        {
          screenName = PopupMenuScreen();
        }
        break;
      case 14:
        {
          screenName = SnackBarScreen();
        }
        break;
      case 15:
        {
          screenName = TextScreen();
        }
        break;
      case 16:
        {
          screenName = CheckBoxScreen();
        }
        break;
    }
    return screenName;
  }
}
