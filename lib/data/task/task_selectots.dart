import 'package:redux/redux.dart';
import 'package:todo/data/redux/app_state.dart';
import 'package:todo/data/task/task_model.dart';
import 'package:todo/data/task/task_state.dart';

class TaskSelectors {

  TaskSelectors();

  List<Task> getAll(Store<AppState> store) {
    return store.state.taskData.items;
  }

  Task getById(Store<AppState> store, String id) {
    return store.state.taskData.items.firstWhere((task) => task.id == id);
  }

  ErrorDialog getError(Store<AppState> store) {
    return store.state.taskData.error;
  }
}