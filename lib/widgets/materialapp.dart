import 'package:flutter/material.dart';

class MaterialAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MaterialApp Demo'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text('This is a sample text to display in a material app'
                'The text can wrap based on the screen width'
                'This is implemented by using Material app.'),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
