import 'package:redux/redux.dart';
import 'package:todo/data/redux/app_state.dart';
import 'package:todo/data/task/task_helper.dart';
import 'package:todo/data/task/task_model.dart';
import 'package:todo/data/task/task_state.dart';



abstract class ViewModel {

}

class TaskListViewModel extends ViewModel {
  final List<Task> tasks;
  final ErrorDialog error;
  final Function create;
  final Function delete;

  TaskListViewModel(Store<AppState> store):
    tasks = Tasks.selectors.getAll(store),
    error = Tasks.selectors.getError(store),
    create = ((Task task) => store.dispatch(Tasks.actions.create(task))),
    delete = ((Task task) => store.dispatch(Tasks.actions.delete(task)));
}