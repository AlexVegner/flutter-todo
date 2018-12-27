import 'package:redux/redux.dart';
import 'package:todo/data/redux/app_state.dart';
import 'package:todo/data/task/task_model.dart';

class TaskSelectors {

  TaskSelectors();

  List<Task> getAll(Store<AppState> store) {
    return store.state.tasks;
  }

  Task getById(Store<AppState> store, String id) {
    return store.state.tasks.firstWhere((task) => task.id == id);
  }
}