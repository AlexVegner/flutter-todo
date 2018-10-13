import 'dart:async';

import 'package:redux_epics/redux_epics.dart';
import 'package:todo/data/redux/app_state.dart';
import 'package:todo/data/task/task_actions.dart';
import 'package:todo/data/task/task_epic.dart';

Stream<dynamic> exampleEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return actions
      .where((action) => action is TaskCreateAction)
      .asyncMap((action) => print("test")
  );
}

final _epics = combineEpics<AppState>([
  taskCreateEpic,
  taskUpdateEpic,
  taskDeleteEpic
]);

final epicMiddleware = new EpicMiddleware(_epics);
