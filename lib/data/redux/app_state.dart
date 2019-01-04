import 'package:todo/data/task/task_model.dart';
import 'package:todo/data/task/task_state.dart';

class AppState {
  bool isAuthenticated;
  
  TaskState taskData;

  AppState(this.taskData, this.isAuthenticated);

  factory AppState.initial() {
    bool isAuthenticated = true;
    var taskData = TaskState.initial();
    var appState = AppState(taskData, isAuthenticated);
    return appState;
  }
}