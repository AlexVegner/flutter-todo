import 'package:todo/data/task/task_model.dart';
import 'package:todo/utils/task_generator.dart';

class AppState {
  bool isAuthenticated;
  List<Task> tasks;

  AppState(this.tasks, this.isAuthenticated);

  factory AppState.initial() {
    List<Task> tasks = generateTaskList(4);
    bool isAuthenticated = true;
    var appState = AppState(tasks, isAuthenticated);
    return appState;
  }
}