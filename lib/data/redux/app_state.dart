import 'package:todo/data/task/task_model.dart';

class AppState {
  bool isAuthenticated;
  List<Task> tasks;

  AppState(this.tasks, this.isAuthenticated);


  factory AppState.initial() {
    List<Task> tasks = [Task(name: 'Task 1'), Task(name: 'Task 2'), Task(name: 'Task 3')];
    bool isAuthenticated = true;
    var appState = AppState(tasks, isAuthenticated);
    return appState;
  }
}