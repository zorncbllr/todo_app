import 'package:flutter/material.dart';

class TodoDialog extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 32, 32, 32),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onCancel,
                  icon: Icon(Icons.cancel_outlined),
                )
              ],
            ),
            Expanded(child: SizedBox()),
            TextField(
              controller: controller,
              style: TextStyle(
                color: Colors.white,
              ),
              cursorColor: Colors.indigo,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.indigo,
                    width: 2,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
              ),
            ),
            TextButton(
              onPressed: onSubmit,
              child: Text(
                'Create',
                style: TextStyle(
                  color: Colors.indigo,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
