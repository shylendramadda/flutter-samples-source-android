import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  @override
  TodoState createState() => TodoState();
}

class TodoState extends State<TodoScreen> {
  List<String> todoItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo List Demo")),
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
              contentPadding: const EdgeInsets.all(14)),
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
