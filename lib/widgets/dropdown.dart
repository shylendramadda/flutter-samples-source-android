import 'package:flutter/material.dart';

class DropDownScreen extends StatefulWidget {
  @override
  DropDownState createState() => DropDownState();
}

class DropDownState extends State<DropDownScreen> {
  var dropdownValue = "One";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dropdown Button"),
        ),
        body: Center(
            child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple, fontSize: 12),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['One', 'Two', 'Three', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )));
  }
}
