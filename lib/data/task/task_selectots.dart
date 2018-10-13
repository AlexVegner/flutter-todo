import 'package:redux/redux.dart';
import 'package:todo/data/redux/app_state.dart';
import 'package:todo/data/task/task_actions.dart';
import 'package:todo/data/task/task_model.dart';

class TaskSelectors {

  TaskSelectors();

  List<Task> getAll(Store<AppState> store) {
    return store.state.tasks;
  }

  Task getFindFirst(Store<AppState> store, String name) {
    return store.state.tasks.firstWhere((task) => task.name == name);
  }

  Function create(Store<AppState> store) {
    return (Task task) => store.dispatch(TaskCreateAction(task));
  }

  Function update(Store<AppState> store) {
    return (Task task) => store.dispatch(TaskCreateAction(task));
  }

  Function delete(Store<AppState> store) {
    return (Task task) => store.dispatch(TaskCreateAction(task));
  }
}