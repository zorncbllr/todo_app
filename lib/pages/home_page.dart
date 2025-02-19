import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:todo_app/components/todo_dialog.dart';
import 'package:todo_app/components/todo_tile.dart';
import 'package:todo_app/models/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _todoBox = Hive.box<Todo>('todoBox');

  final TextEditingController _todoController = TextEditingController();

  List<Todo> todoList = [];

  @override
  void initState() {
    todoList = _todoBox.values.toList();
    super.initState();
  }

  void createNewTodo(BuildContext context) {
    setState(() {
      Todo todo = Todo(task: _todoController.text, status: false);
      _todoBox.add(todo);
      _todoController.clear();
      todoList = _todoBox.values.toList();
      Navigator.of(context).pop();
    });
  }

  void cancelTodo(BuildContext context) {
    _todoController.clear();
    Navigator.of(context).pop();
  }

  void deleteTodo(Todo todo) {
    setState(() {
      todo.delete();
      todoList = _todoBox.values.toList();
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => TodoDialog(
        controller: _todoController,
        onSubmit: () => createNewTodo(context),
        onCancel: () => cancelTodo(context),
      ),
    );
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
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) => TodoTile(
            todo: todoList[index],
            onDelete: deleteTodo,
          ),
        ),
      ),

      // add action
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white12,
        onPressed: _showDialog,
        child: Icon(
          Icons.add,
          color: Colors.indigo,
        ),
      ),
    );
  }
}
