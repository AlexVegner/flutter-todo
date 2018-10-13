import 'package:todo/data/task/task_actions.dart';
import 'package:todo/data/task/task_selectots.dart';

abstract class Tasks {
  static final TaskActions actions = TaskActions();
  static final TaskSelectors selectors = TaskSelectors();
}