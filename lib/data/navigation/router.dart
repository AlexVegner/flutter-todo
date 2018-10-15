
import 'package:flutter/material.dart';
import 'package:todo/data/app/app.dart';
import 'package:todo/data/task/task_helper.dart';
import 'package:todo/data/task/task_model.dart';
import 'package:todo/pages/tasks/task_edit_page.dart';
import 'package:todo/pages/tasks/task_list_page.dart';

abstract class Router {

  static final Widget home = TaskListPage();

  static final Map<String, WidgetBuilder> routes = {
    '/tasks' : (BuildContext context) => TaskListPage(),
  };

  static final RouteFactory onGenerateRoute = (RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    if (pathElements[0] != '') {
      return null;
    }
    if (pathElements[1] == 'task') {
      if (pathElements[2] == 'create') {
        return MaterialPageRoute<bool>(
          builder: (BuildContext context) => TaskEditPage(Task()),
        );
      } else {
        final int taskId = int.parse(pathElements[2]);
        Task task = Tasks.selectors.getById(App().store, taskId);
        return MaterialPageRoute<bool>(
          builder: (BuildContext context) => TaskEditPage(task),
        );
      }
    }
    return null;
  };

  static final RouteFactory onUnknownRoute = (RouteSettings settings) {
    return MaterialPageRoute(
        builder: (BuildContext context) => TaskListPage()
    );
  };
}