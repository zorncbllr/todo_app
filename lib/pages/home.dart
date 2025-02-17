import 'package:flutter/material.dart';
import 'package:todo_app/components/todo_dialog.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/components/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todoList = [
    Todo(task: 'Learn flutter development.', status: false),
    Todo(task: 'Create a powerpoint presentation.', status: false),
    Todo(task: 'Learn regular expressions.', status: false),
  ];

  final TextEditingController _controller = TextEditingController();

  void _createTodo(BuildContext context) {
    setState(() {
      todoList.add(Todo(
        task: _controller.text,
        status: false,
      ));
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  void _onCancel(BuildContext context) {
    _controller.clear();
    Navigator.of(context).pop();
  }

  void _onDelete(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white10,
        foregroundColor: Colors.white,
        title: Text('Todo App'),
      ),

      // todo list
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) => TodoTile(
            todo: todoList[index],
            onDelete: (_) => _onDelete(index),
          ),
        ),
      ),

      // add button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              child: TodoDialog(
                controller: _controller,
                onSubmit: () => _createTodo(context),
                onCancel: () => _onCancel(context),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
