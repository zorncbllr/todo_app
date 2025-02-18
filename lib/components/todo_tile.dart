import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/models/todo.dart';

class TodoTile extends StatefulWidget {
  Todo todo;
  Function(Todo) onDelete;

  TodoTile({
    super.key,
    required this.todo,
    required this.onDelete,
  });

  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  void _onChange(bool? _) {
    setState(() {
      widget.todo.status = !widget.todo.status;
      widget.todo.save();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: (_) {
              widget.onDelete(widget.todo);
            },
            icon: Icons.delete_outline,
            backgroundColor: Colors.indigo,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          )
        ]),

        // main tile
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Checkbox(
                value: widget.todo.status,
                onChanged: _onChange,
                activeColor: Colors.indigo,
              ),
              Text(
                widget.todo.task,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
