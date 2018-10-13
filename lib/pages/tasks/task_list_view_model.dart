import 'package:redux/redux.dart';
import 'package:todo/data/redux/app_state.dart';
import 'package:todo/data/task/task_helper.dart';
import 'package:todo/data/task/task_model.dart';

class TaskListViewModel {
  final List<Task> tasks;
  final Function create;

  TaskListViewModel(Store<AppState> store):
    tasks = Tasks.selectors.getAll(store),
    create = Tasks.selectors.create(store);
}