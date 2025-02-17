import 'package:flutter/material.dart';
import 'package:todo_app/pages/home.dart';

void main(List<String> args) {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
