import 'package:hive_ce/hive.dart';
import 'package:todo_app/models/todo.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<Todo>()])
void _() {}
