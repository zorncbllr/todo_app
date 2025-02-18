import 'package:hive_ce/hive.dart';

class Todo extends HiveObject {
  String task;
  bool status;

  Todo({
    required this.task,
    required this.status,
  });
}
