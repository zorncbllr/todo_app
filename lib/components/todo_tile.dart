import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatefulWidget {
  Todo todo;
  Function(BuildContext) onDelete;

  TodoTile({
    super.key,
    required this.todo,
    required this.onDelete,
  });

  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              backgroundColor: Colors.deepPurple,
              onPressed: widget.onDelete,
              icon: Icons.delete_outline,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            )
          ],
        ),

        // main todo tile
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 37, 37, 37),
            borderRadius: BorderRadius.circular(8),
          ),
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
        ),
      ),
    );
  }
}
