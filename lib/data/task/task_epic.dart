import 'dart:async';

import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo/data/redux/app_state.dart';

import 'task_actions.dart';

Stream<dynamic> taskCreateEpic(
    Stream<dynamic> actions,
    EpicStore<AppState> store) {
  return Observable(actions)
      .ofType(new TypeToken<TaskCreateAction>())
      .map((action) {
    print("TaskCreateAction");
    return TaskCreateStateAction(action.item);
  });
}

Stream<dynamic> taskUpdateEpic(
    Stream<dynamic> actions,
    EpicStore<AppState> store) {
  return Observable(actions)
      .ofType(new TypeToken<TaskUpdateAction>())
      .map((action) {
    print("TaskUpdateAction");
    return TaskUpdateStateAction(action.item);
  });
}


Stream<dynamic> taskDeleteEpic(
    Stream<dynamic> actions,
    EpicStore<AppState> store) {
  return Observable(actions)
      .ofType(new TypeToken<TaskDeleteAction>())
      .map((action) {
    print("TaskDeleteAction");
    return TaskDeleteStateAction(action.item);
  });
}