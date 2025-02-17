import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoTile extends StatefulWidget {
  Todo todo;

  TodoTile({super.key, required this.todo});

  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 37, 37, 37),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Checkbox(
            value: widget.todo.status,
            onChanged: (value) {
              setState(() {
                widget.todo.status = !widget.todo.status;
              });
            },
          ),
          Text(
            widget.todo.task,
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
