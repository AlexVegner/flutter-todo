import 'package:todo/data/task/task_model.dart';

class TaskState {

  List<Task> items;
  ErrorDialog error;
  Task current;
  

  TaskState(this.items, this.current, this.error);

  factory TaskState.initial() {
    List<Task> tasks = [];
    var appState = TaskState(tasks, null, null);
    return appState;
  }
}

class ErrorDialog {
  final String title;

  ErrorDialog(this.title);
}