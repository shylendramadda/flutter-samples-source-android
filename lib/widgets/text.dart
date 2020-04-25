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
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
              ),
              RichText(
                text: TextSpan(
                  text: 'Rich Text',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: ' bold',
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
              ),
              Text(
                'It is a strikethrough text',
                style: TextStyle(decoration: TextDecoration.lineThrough),
              ),
              Text(
                'It is a underlined text',
                style: TextStyle(decoration: TextDecoration.underline),
              )
            ],
          ),
        ));
  }
}
