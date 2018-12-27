import 'package:todo/data/task/task_model.dart';

int _count = 0;

String generateName() {
  return "Task${_count++}";
}

Task generateTask({String name}) {
  final index = (_count++).toString();
  final String _name = name ?? "Task$index" ;
  return Task(name: _name, id: index);
}

List<Task> generateTaskList(int n) {
  List<Task> list = [];
  for (int i = 0; i < n; i++) {
    list.add(generateTask());
  }
  return list;
}