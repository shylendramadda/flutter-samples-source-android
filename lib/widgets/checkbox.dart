import 'package:flutter/material.dart';

class CheckBoxScreen extends StatefulWidget {
  @override
  CheckBoxState createState() => CheckBoxState();
}

class CheckBoxState extends State<CheckBoxScreen> {
  bool monVal = false;
  bool tuVal = false;
  bool wedVal = false;
  bool thurVal = false;
  bool friVal = false;
  bool satVal = false;
  bool sunVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Checkbox Demo")),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    checkbox("Monday", monVal),
                    checkbox("Tuesday", tuVal),
                    checkbox("Wednesday", wedVal),
                    checkbox("Thursday", thurVal),
                    checkbox("Friday", friVal),
                    checkbox("Saturday", satVal),
                    checkbox("Sunday", sunVal),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget checkbox(String title, bool boolValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            setState(() {
              switch (title) {
                case "Monday":
                  monVal = value;
                  break;
                case "Tuesday":
                  tuVal = value;
                  break;
                case "Wednesday":
                  wedVal = value;
                  break;
                case "Thursday":
                  thurVal = value;
                  break;
                case "Friday":
                  friVal = value;
                  break;
                case "Saturday":
                  satVal = value;
                  break;
                case "Sunday":
                  sunVal = value;
                  break;
              }
            });
          },
        )
      ],
    );
  }
}
