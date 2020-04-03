import 'package:flutter/material.dart';
import 'package:fluttersamples/sample.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Sample> sampleEntries = List();

  @override
  Widget build(BuildContext context) {
    sampleEntries.add(new Sample(1, "Splash Screen", """" 
    
    import 'dart:async';

        import 'package:flutter/material.dart';

        import 'home.dart';

        void main() {
    runApp(MaterialApp(
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
    '/HomeScreen': (BuildContext context) => HomeScreen()
    },
    ));
    }

        class SplashScreen extends StatefulWidget {
        @override
        SplashScreenState createState() => SplashScreenState();
        }

        class SplashScreenState extends State<SplashScreen> {
        @override
        void initState() {
        super.initState();
        startTime();
        }

        startTime() async {
        var duration = Duration(seconds: 2);
        return Timer(duration, navigationPage);
        }

        void navigationPage() {
        Navigator.of(context).pushReplacementNamed('/HomeScreen');
        }

        @override
        Widget build(BuildContext context) {
        return Scaffold(
        body: Center(
        child: Image.asset('assets/images/flutter_icon.png',
        width: 200, height: 200, fit: BoxFit.fill),
        ),
        );
        }
        }
        
        """));
    sampleEntries.add(new Sample(2, "Login Screen", """
        
        import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'TutorialKart',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
} 
    """));
    sampleEntries.add(Sample(3, "Todo List", """
    
    import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  @override
  TodoScreenState createState() => TodoScreenState();
}

class TodoScreenState extends State<TodoScreen> {
  List<String> todoItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo List")),
      body: createTodoList(),
      floatingActionButton: FloatingActionButton(
          onPressed: navigateToTodoScreen,
          tooltip: 'Add Todo',
          child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void navigateToTodoScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: Text('Add an item')),
        body: TextField(
          autofocus: true,
          onSubmitted: (val) {
            addTodoItem(val);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
              hintText: 'Write todo text',
              contentPadding: const EdgeInsets.all(14.0)),
        ),
      );
    }));
  }

  void addTodoItem(String val) {
    if (val.length > 0) {
      setState(() {
        todoItems.add(val);
      });
    }
  }

  Widget createTodoList() {
    return ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          return createTodoItem(todoItems[index], index);
        });
  }

  Widget createTodoItem(String todoText, int index) {
    return ListTile(
      title: Text(todoText),
      onTap: () => showAlertToRemove(index),
    );
  }

  void showAlertToRemove(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Are you want to delete this item?"),
              actions: <Widget>[
                FlatButton(
                    child: Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop()),
                FlatButton(
                  child: Text('Delete'),
                  onPressed: () {
                    deleteTodoItem(index);
                    Navigator.of(context).pop();
                  },
                )
              ]);
        });
  }

  void deleteTodoItem(int index) {
    setState(() {
      todoItems.removeAt(index);
    });
  }
}

    """));

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
      MaterialPageRoute(
          builder: (context) => SampleScreen(sample: sampleEntries[index])),
    );
  }
}

class Sample {
  final int id;
  final String title;
  final String sourceCode;

  Sample(this.id, this.title, this.sourceCode);
}
