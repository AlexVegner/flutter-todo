// Individual Reducers. Each reducer will handle actions related to the State Tree it cares about!

// The Items Reducer will take in the items from the State tree and the dispatched action and
// return a new list of items if it handles the action!
import 'package:todo/data/redux/app_state.dart';
import 'package:todo/data/task/task_reducer.dart';

AppState appStateReducer(AppState state, action) => new AppState(
    tasksReducer(state.tasks, action),
    true,
);

