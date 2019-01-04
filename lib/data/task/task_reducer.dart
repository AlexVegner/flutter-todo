import 'package:todo/data/redux/actions.dart';
import 'package:todo/data/task/task_actions.dart';
import 'package:todo/data/task/task_model.dart';
import 'package:todo/data/task/task_state.dart';

List<Task> _resetTaskListReducer(List<Task> items, TaskGetAllStateAction action) {
  return action.item;
}

List<Task> _resetTaskReducer(List<Task> items, TaskGetIdStateAction action) {
  int index = items.indexWhere((task) => task.id == action.item.id);
  if (index == -1) {
    index = items.length - 1;
  }
  return List<Task>.from(items).where((item) => item.id != action.item.id).toList()
    ..insert(index , action.item);
}

List<Task> _addTaskReducer(List<Task> items, TaskCreateStateAction action) {
  return List<Task>.from(items)
    ..add(action.item);
}

List<Task> _updateTaskReducer(List<Task> items, TaskUpdateStateAction action) {
  int index = items.indexWhere((task) => task.id == action.item.id);
  if (index == -1) {
    index = items.length - 1;
  }
  return List<Task>.from(items).where((item) => item.id != action.item.id).toList()
    ..insert(index , action.item);
}

List<Task> _deleteTaskReducer(List<Task> items, TaskDeleteStateAction action) {
  return List<Task>.from(items).where((item) => item.id != action.item.id).toList();
}

ErrorDialog _serverErrorReducer(ErrorDialog error, TaskServerErrorAction action) {
  return action.item;
}

TaskState tasksReducer(TaskState taskData, Action action) {
  if (action is TaskGetAllStateAction) {
    return TaskState(_resetTaskListReducer(taskData.items, action), taskData.current, taskData.error);
  } else if (action is TaskGetIdStateAction) {
    return TaskState(_resetTaskReducer(taskData.items, action), taskData.current, taskData.error);
  } else if (action is TaskCreateStateAction) {
    return TaskState(_addTaskReducer(taskData.items, action), taskData.current, taskData.error);
  } else if (action is TaskUpdateStateAction) {
    return TaskState(_updateTaskReducer(taskData.items, action), taskData.current, taskData.error);
  } else if (action is TaskDeleteStateAction) {
    return TaskState(_deleteTaskReducer(taskData.items, action), taskData.current, taskData.error);
  } else if (action is TaskServerErrorAction) {
    return TaskState(taskData.items, taskData.current, _serverErrorReducer(taskData.error, action));
  } else {
    return taskData;
  }
}