import 'package:flutter/material.dart';

import 'database_helper.dart';

class TodoListApp extends StatefulWidget {
  const TodoListApp({Key? key}) : super(key: key);

  @override
  State<TodoListApp> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  String todoEdited = "";
  final dbHelper = DatabaseHelper.instance;
  final todoController = TextEditingController();
  bool validated = true;
  String errorMessage = "";
  var myTodos = [];
  List<Widget> children = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snap) {
      if (snap.hasData == null) {
        return const Center(
          child: Text("NO DATA"),
        );
      } else {
        if (myTodos.length == 0) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "My Todos",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: const Center(
              child: Text(
                "No Tasks Available",
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: showAlertDialog,
              backgroundColor: Colors.purple,
              child: const Icon(Icons.add),
            ),
          );
        }else{
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "My Todos",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: children,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: showAlertDialog,
              backgroundColor: Colors.purple,
              child: const Icon(Icons.add),
            ),
          );
        }
      }
    },future: queryAllTodosInTable(),);
  }

  void insertTodo() async {
    Map<String, dynamic> todo = {
      DatabaseHelper.columnName: todoEdited,
    };
    final id = await dbHelper.insert(todo);
    print(id);
    Navigator.of(context,rootNavigator: true).pop();
    todoEdited = "";
    setState((){
      validated = true;
      errorMessage = "";
    });

  }

  void showAlertDialog() {
    todoController.text="";
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: const Text("Add Todo"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: todoController,
                    autofocus: true,
                    onChanged: (value) {
                      todoEdited = value;
                    },
                    style: const TextStyle(fontSize: 18.0),
                    decoration: InputDecoration(
                      errorText: validated ? null : errorMessage,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  MaterialButton(
                    color: Colors.purple,
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (todoController.text.isEmpty) {
                        setState(() {
                          errorMessage = "Cannot be Empty";
                          validated = false;
                        });
                      } else if (todoController.text.length > 500) {
                        setState(() {
                          errorMessage = "Too Many Characters";
                          validated = false;
                        });
                      } else {
                        insertTodo();
                      }
                    },
                  ),
                ],
              ),
            );
          });
        });
  }

  Future<bool> queryAllTodosInTable() async {
    myTodos =[];
    children=[];
    var allTodos = await dbHelper.queryAllTodos();
    allTodos?.forEach((todo) {
      myTodos.add(todo.toString());
      children.add(Card(
        elevation: 5.0,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: Text(
              todo['todo'],
              style: const TextStyle(fontSize: 18.0),
            ),
            onLongPress: () {
              setState(() {
                dbHelper.delete(3);
              });
            },
          ),
        ),
      ));
    });
    return Future.value(true);
  }
}
// return Scaffold(
// appBar: AppBar(
// title: const Text(
// "My Todos",
// style: TextStyle(
// fontWeight: FontWeight.bold,
// ),
// ),
// centerTitle: true,
// ),
// body: SingleChildScrollView(
// child: Column(
// children: children,
// ),
// ),
// floatingActionButton: FloatingActionButton(
// onPressed: showAlertDialog,
// backgroundColor: Colors.purple,
// child:  const Icon(Icons.add),
// ),
// );
