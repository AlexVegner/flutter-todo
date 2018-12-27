import 'package:todo/data/task/task_model.dart';

class AppState {
  bool isAuthenticated;
  List<Task> tasks;

  AppState(this.tasks, this.isAuthenticated);

  factory AppState.initial() {
    List<Task> tasks = [];
    bool isAuthenticated = true;
    var appState = AppState(tasks, isAuthenticated);
    return appState;
  }
}