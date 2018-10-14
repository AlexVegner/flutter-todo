import 'package:todo/data/task/task_model.dart';

int _count = 1;

String generateName() {
  return "Task${_count++}";
}

Task generateTask() {
  return Task(name: generateName());
}

List<Task> generateTaskList(int n) {
  List<Task> list = [];
  for (int i = 0; i < n; i++) {
    list.add(Task(name: generateName()));
  }
  return list;
}