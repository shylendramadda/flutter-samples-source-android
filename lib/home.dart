import 'package:flutter/material.dart';
import 'package:fluttersamples/sample.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  List<Sample> sampleEntries = List();

  @override
  Widget build(BuildContext context) {

    sampleEntries.add(new Sample(1, "Splash Screen 1", "Description1"));
    sampleEntries.add(new Sample(2, "Splash Screen 2", "Description2"));
    sampleEntries.add(new Sample(3, "Splash Screen 3", "Description3"));

    sampleEntries.add(new Sample(4, "Login Screen 1", "Description4"));
    sampleEntries.add(new Sample(5, "Login Screen 2", "Description5"));
    sampleEntries.add(new Sample(6, "Login Screen 3", "Description6"));
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Samples'),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: sampleEntries.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('${sampleEntries[index].title}'),
//              subtitle: Text('Sub title'),
              onTap: () => onTapped(index, context),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }

  onTapped(int index, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SampleScreen(sample: sampleEntries[index])),
    );
  }

}

class Sample {
  final int id;
  final String title;
  final String description;

  Sample(this.id, this.title, this.description);
}
