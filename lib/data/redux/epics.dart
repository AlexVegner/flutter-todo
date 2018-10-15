import 'package:redux_epics/redux_epics.dart';
import 'package:todo/data/redux/app_state.dart';
import 'package:todo/data/task/task_epic.dart';

final _epics = combineEpics<AppState>(taskEpics);

final epicMiddleware = new EpicMiddleware(_epics);
