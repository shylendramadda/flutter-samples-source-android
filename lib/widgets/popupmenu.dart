import 'package:flutter/material.dart';

class PopupMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Popup Menu Demo"),
        ),
        body: Center(
            child: PopupMenuButton<int>(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Text("First"),
            ),
            PopupMenuItem(
              value: 2,
              child: Text("Second"),
            ),
            PopupMenuItem(
              value: 3,
              child: Text("Third"),
            ),
          ],
          initialValue: 1,
          onCanceled: () {
            showSnackBar(context, 'You have canceled the menu.');
          },
          onSelected: (value) {
            showSnackBar(context, 'You have selected the $value.');
          },
          icon: Icon(Icons.list),
        )));
  }

  void showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1000),
    ));
  }
}
