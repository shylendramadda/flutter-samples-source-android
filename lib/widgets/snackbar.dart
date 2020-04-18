import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SnackBar Demo"),
        ),
        body: Center(
          child: RaisedButton(
              child: Text('Show SnackBar', style: TextStyle(fontSize: 20)),
              color: Colors.amberAccent,
              onPressed: () {
                showSnackBar(
                    context, "This is a snack bar message with icon", 2000);
              }),
        ));
  }

  void showSnackBar(BuildContext context, String message, int duration) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Row(
        children: <Widget>[
          Icon(Icons.favorite_border, color: Colors.deepOrange),
          Text(
            message,
            style: TextStyle(color: Colors.amber),
          )
        ],
      ),
      duration: Duration(milliseconds: duration),
    ));
  }
}
