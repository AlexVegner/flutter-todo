import 'dart:async';

import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo/data/api/api.dart';
// import 'package:todo/data/redux/actions.dart';
import 'package:todo/data/redux/app_state.dart';
import 'package:todo/data/task/task_helper.dart';
import 'package:todo/data/task/task_state.dart';
import 'task_actions.dart';

Stream<dynamic> _taskInitEpic(
    Stream<dynamic> actions, EpicStore<AppState> store) {
  return Observable(actions)
    .ofType(new TypeToken<TaskGetAllAction>())
    .flatMap((action) => Observable.fromIterable([
       Tasks.actions.getAll()
    ]));
  }


Stream<dynamic> _taskGetAllEpic(
    Stream<dynamic> actions, EpicStore<AppState> store) {
  return Observable(actions)
    .ofType(new TypeToken<TaskGetAllAction>())
    .asyncMap(
      (action) => Api()
          .tasks
          .getAll()
          .then((taskList) => TaskServerErrorAction(ErrorDialog("Error: _taskCreateEpic"))) //Tasks.actions.stateGetAll(taskList))
          .catchError((error) => print("Error: ${error.toString()}")));
}

Stream<dynamic> _taskGetIdEpic(
    Stream<dynamic> actions, EpicStore<AppState> store) {
  return Observable(actions)
    .ofType(new TypeToken<TaskGetIdAction>())
    .asyncMap(
      (action) => Api()
          .tasks
          .getId(action.item)
          .then((task) => Tasks.actions.stateGetId(task))
          .catchError((error) => print("Error: ${error.toString()}")));
}

Stream<dynamic> _taskCreateEpic(
    Stream<dynamic> actions, EpicStore<AppState> store) {
  return Observable(actions)
    .ofType(new TypeToken<TaskCreateAction>())
    .asyncMap(
      (action) => Api()
          .tasks
          .create(action.item)
          .then((task) => Tasks.actions.stateCreate(task))
          .catchError((error) => TaskServerErrorAction(ErrorDialog("Error: _taskCreateEpic"))));
}

Stream<dynamic> _taskUpdateEpic(
    Stream<dynamic> actions, EpicStore<AppState> store) {
  return Observable(actions)
    .ofType(new TypeToken<TaskUpdateAction>())
    .asyncMap(
      (action) => Api()
          .tasks
          .update(action.item)
          .then((task) => Tasks.actions.stateUpdate(task))
          .catchError((error) => print("Error: ${error.toString()}")));
}

Stream<dynamic> _taskDeleteEpic(
    Stream<dynamic> actions, EpicStore<AppState> store) {
  return Observable(actions)
    .ofType(new TypeToken<TaskDeleteAction>())
    .asyncMap(
      (action) => Api()
          .tasks
          .delete(action.item)
          .then((_) => Tasks.actions.stateDelete(action.item))
          .catchError((error) => print("Error: ${error.toString()}")));
}

List taskEpics = List<Epic<AppState>>.from([
  //_taskInitEpic,
  _taskGetAllEpic,
  _taskGetIdEpic,
  _taskCreateEpic,
  _taskUpdateEpic,
  _taskDeleteEpic,
]);