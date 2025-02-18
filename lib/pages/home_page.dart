import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:todo_app/models/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _todoBox = Hive.box<Todo>('todoBox');
  List<Todo> todoList = [];

  @override
  void initState() {
    if (_todoBox.isEmpty) {
      todoList = [
        Todo(task: 'Learn flutter development.', status: false),
        Todo(task: 'Learn database normalization', status: false),
        Todo(task: 'Integrate hive local database.', status: false),
      ];
      _todoBox.addAll(todoList);
    } else {
      todoList = _todoBox.values.toList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: Text('Todo App'),
        centerTitle: true,
        backgroundColor: Colors.white10,
        foregroundColor: Colors.white,
      ),

      // todolist
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(
              bottom: 8,
            ),
            color: Colors.white10,
            child: Text(
              todoList[index].task,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
