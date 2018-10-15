import 'package:todo/data/redux/actions.dart';
import 'package:todo/data/task/task_actions.dart';
import 'package:todo/data/task/task_model.dart';

List<Task> _addTaskReducer(List<Task> items, TaskCreateStateAction action) {
  return new List.from(items)
    ..add(action.item);
}

List<Task> _updateTaskReducer(List<Task> items, TaskUpdateStateAction action) {
  int index = items.indexWhere((task) => task.id == action.item.id);
  if (index == -1) {
    index = items.length - 1;
  }
  return new List.from(items).where((item) => item.id != action.item.id).toList().cast<Task>()
    ..insert(index , action.item);
}

List<Task> _deleteTaskReducer(List<Task> items, TaskDeleteStateAction action) {
  return new List.from(items).where((item) => item.id != action.item.id).toList().cast<Task>();
}

List<Task> tasksReducer(List<Task> items, Action action) {
  if (action is TaskCreateStateAction) {
    return _addTaskReducer(items, action);
  } else if (action is TaskUpdateStateAction) {
    return _updateTaskReducer(items, action);
  } else if (action is TaskDeleteStateAction) {
    return _deleteTaskReducer(items, action);
  } else {
    return items;
  }
}