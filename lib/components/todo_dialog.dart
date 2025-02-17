import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoDialog extends StatefulWidget {
  TextEditingController controller;
  VoidCallback onSubmit;
  VoidCallback onCancel;

  TodoDialog({
    super.key,
    required this.controller,
    required this.onSubmit,
    required this.onCancel,
  });

  @override
  _TodoDialogState createState() => _TodoDialogState();
}

class _TodoDialogState extends State<TodoDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 37, 37, 37),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: widget.onCancel,
                icon: Icon(Icons.cancel_outlined),
              )
            ],
          ),
          Expanded(child: SizedBox()),
          TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 18,
              ),
            ),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          TextButton(
            onPressed: widget.onSubmit,
            child: Text('Create'),
          )
        ],
      ),
    );
  }
}
