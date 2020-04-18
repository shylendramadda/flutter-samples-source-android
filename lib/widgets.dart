import 'package:FlutterSamples/samplepreview.dart';
import 'package:flutter/material.dart';

import 'main/home.dart';

class WidgetsScreen extends StatefulWidget {
  @override
  WidgetsState createState() => WidgetsState();
}

class WidgetsState extends State<WidgetsScreen> {
  List<Sample> sampleEntries = List();

  @override
  Widget build(BuildContext context) {

    sampleEntries.add(Sample(15, "Text", """

import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Text Demo')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Simple Text"),
              Text(
                "This is a overflow text. It will show ellipsis at the end when the text reaches at the end of the screen.",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              RichText(
                text: TextSpan(
                  text: 'Rich Text',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'bold',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' world!'),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: 'Text.rich text', // default text style
                  children: <TextSpan>[
                    TextSpan(
                        text: ' beautiful ',
                        style: TextStyle(fontStyle: FontStyle.italic)),
                    TextSpan(
                        text: 'world',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

    """));

    sampleEntries.add(Sample(11, "Button", """
    
    import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Button Demo"),
        ),
        body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                      child: Text('Flat Button',
                          style: TextStyle(fontSize: 20, color: Colors.blue)),
                      onPressed: () {}),
                  SizedBox(height: 20), // for add space
                  IconButton(
                      icon: Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.red,
                        size: 36,
                      ),
                      tooltip: 'Image Button',
                      onPressed: () {}),
                  SizedBox(height: 20),
                  RaisedButton(
                    child:
                        Text('Disabled Button', style: TextStyle(fontSize: 20)),
                    onPressed: null,
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                      child: const Text('Enabled Button',
                          style: TextStyle(fontSize: 20)),
                      onPressed: () {}),
                  SizedBox(height: 20),
                  RaisedButton(
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('Gradient Button',
                            style: TextStyle(fontSize: 20)),
                      ),
                      onPressed: () {}),
                  SizedBox(height: 20),
                  FloatingActionButton.extended(
                      label: Text('Floating Action Button'),
                      icon: Icon(Icons.thumb_up),
                      backgroundColor: Colors.blue,
                      onPressed: () {}),
                  SizedBox(height: 20),
                  OutlineButton(
                      child: new Text("Outline Button"),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {})
                ],
              ),
            ),
          ],
        ));
  }
}

    """));

    sampleEntries.add(Sample(12, "Dropdown", """
    
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
          title: Text("DropDown Button"),
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

    """));

    sampleEntries.add(Sample(13, "Popup Menu", """
    
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
            showSnackBar(context, 'You have selected the value.');
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

    """));

    sampleEntries.add(Sample(14, "Snack Bar", """

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

    """));

    sampleEntries.add(Sample(16, "Checkbox", """

import 'package:flutter/material.dart';

class CheckboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool monVal = false;
    bool tuVal = false;
    bool wedVal = false;
    bool thurVal = false;
    bool friVal = false;
    bool satVal = false;
    bool sunVal = false;

    return Scaffold(
        appBar: AppBar(title: Text("Check Box Demo")),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    checkbox("Monday", monVal),
                    checkbox("Tuesday", tuVal),
                    checkbox("Wednesday", wedVal),
                    checkbox("Thursday", thurVal),
                    checkbox("Friday", friVal),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {},
        )
      ],
    );
  }
}

    """));

    return Scaffold(
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: sampleEntries.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: ListTile(
                title: Text('${sampleEntries[index].title}'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () => onTapped(index, context),
              ));
            }));
  }

  onTapped(int index, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SamplePreviewScreen(sample: sampleEntries[index])),
    );
  }
}
