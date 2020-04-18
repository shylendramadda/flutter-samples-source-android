import 'package:FlutterSamples/samples.dart';
import 'package:FlutterSamples/widgets.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'appinfo.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;
  final List<Widget> _widgetOptions = [WidgetsScreen(), SamplesScreen()];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onBackPressed,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text('Flutter Samples'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.share),
                color: Colors.white,
                tooltip: 'Share app',
                onPressed: () {
                  /*Share.share(
                      'Check out my app Flutter Samples at https://play.google.com/store/apps/details?id=com.geeklabs.fluttersamples'
                  );*/
                  Share.share(
                      'Check out the app Flutter Samples at https://play.google.com/store/apps/details?id=com.geeklabs.fluttersamples '
                          'Where you can learn Flutter language which supports Android, iOS and Web with source code and output preview too.',
                      subject: 'Flutter Samples Android app');
                },
              ),
              IconButton(
                icon: const Icon(Icons.announcement),
                color: Colors.white,
                tooltip: 'App Info',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppInfoScreen()),
                  );
                },
              ),
            ],
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.widgets),
                title: Text('Widgets'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.desktop_mac),
                title: Text('Samples'),
              )
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: onItemTapped,
          ),
        ));
  }

  Future<bool> onBackPressed() {
    if (_selectedIndex == 1) {
      onItemTapped(0);
      return Future.value(false);
    } else {
      return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to exit an App'),
              actions: <Widget>[
                GestureDetector(
                  child: FlatButton(
                      child: Text("No"),
                      onPressed: () => Navigator.of(context).pop(false)),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  child: FlatButton(
                      child: Text("YES", style: TextStyle(color: Colors.grey)),
                      onPressed: () => Navigator.of(context).pop(true)),
                ),
              ],
            ),
          ) ??
          Future.value(false);
    }
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class Sample {
  final int id;
  final String title;
  final String sourceCode;

  Sample(this.id, this.title, this.sourceCode);
}
