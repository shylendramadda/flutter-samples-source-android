import 'package:FlutterSamples/sample.dart';
import 'package:flutter/material.dart';

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

    sampleEntries.add(Sample(4, "Gallary", """ 
    
    import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  @override
  GalleryState createState() => GalleryState();
}

class GalleryState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallary Demo"),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(50, (index) {
          return GridTile(
            child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 6.0,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Image.asset(
                            "assets/images/om.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Image title"))
                      ],
                    ))),
          );
        }),
      ),
    );
  }
}
    
    """));

    sampleEntries.add(Sample(5, "Home Screen", """
    
    import 'package:flutter/material.dart';

class HomeSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Demo"),
        ),
        body: ListView(
          children: [
            Image.asset('assets/images/flutter_icon.png',
                width: 600, height: 240, fit: BoxFit.fill),
            titleSection,
            _buildButtonSection,
            textSection
          ],
        ));
  }

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Text('41'),
      ],
    ),
  );

  Widget _buildButtonSection = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
        _buildButtonColumn(Colors.blue, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(Colors.blue, Icons.share, 'SHARE'),
      ],
    ),
  );

  static Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );
}
    
    """));

    sampleEntries.add(Sample(6, "Drawer", """
    import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Demo'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

    """));

    sampleEntries.add(Sample(7, "AppBar", """
    
    import 'package:flutter/material.dart';

class AppBarScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {
              openPage(context);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'This is the home page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  void openPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Next page'),
          ),
          body: const Center(
            child: Text(
              'This is the next page',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    ));
  }
}
    
    """));

    sampleEntries.add(Sample(8, "BottomNavigation", """
    
    import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
    
    """));

    sampleEntries.add(Sample(9, "Silver App Bar", """
    
    import 'package:flutter/material.dart';

class SliverAppBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Silver App Bar')),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Demo'),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Grid Item'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('List Item'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

    """));

    sampleEntries.add(Sample(10, "Tab Bar", """
    
    import 'package:flutter/material.dart';

class TabBarClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

    """));

    return WillPopScope(
        onWillPop: onBackPressed,
        child: new Scaffold(
            appBar: new AppBar(
              title: new Text('Flutter Samples'),
            ),
            body: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: sampleEntries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: ListTile(
                    title: Text('${sampleEntries[index].title}'),
//              subtitle: Text('Sub title'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => onTapped(index, context),
                  ));
                })));
  }

  onTapped(int index, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SampleScreen(sample: sampleEntries[index])),
    );
  }

  Future<bool> onBackPressed() {
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
        false;
  }
}

class Sample {
  final int id;
  final String title;
  final String sourceCode;

  Sample(this.id, this.title, this.sourceCode);
}
