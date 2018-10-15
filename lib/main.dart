import 'package:flutter/material.dart';
import 'package:todo/data/app/app.dart';
import 'package:todo/data/navigation/navigation.dart';
import 'package:todo/data/redux/app_state.dart';
import 'package:todo/data/redux/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo/data/task/task_helper.dart';
import 'package:todo/data/task/task_model.dart';
import 'package:todo/pages/tasks/task_edit_page.dart';
import 'package:todo/pages/tasks/task_list_page.dart';

void main() {
  final store = createDefaultStore();
  final navigatorKey = createNavigatorKey();

  final app = App.ini(store, navigatorKey);

  runApp(new AppWidget(
    app: app,
  ));
}

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.

  final App app;

  AppWidget({Key key, @required this.app}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: app.store,
        child: MaterialApp(
          title: app.appTitle,
          navigatorKey: app.navigatorKey,
          theme: new ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
            // counter didn't reset back to zero; the application is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: new TaskListPage(),
            routes: {
              '/tasks' : (BuildContext context) => TaskListPage(),
            },
          onGenerateRoute: (RouteSettings settings) {
            final List<String> pathElements = settings.name.split('/');
            if (pathElements[0] != '') {
              return null;
            }
            if (pathElements[1] == 'task') {
              if (pathElements[2] == 'create') {
                print('create');
                return MaterialPageRoute<bool>(
                  builder: (BuildContext context) => TaskEditPage(Task()),
                );
              } else {
                final int taskId = int.parse(pathElements[2]);
                Task task = Tasks.selectors.getFindFirst(App().store, taskId);
                return MaterialPageRoute<bool>(
                  builder: (BuildContext context) => TaskEditPage(task),
                );
              }
            }
            return null;
          },
//          onUnknownRoute: (RouteSettings settings) {
//            return MaterialPageRoute(
//                builder: (BuildContext context) => MyHomePage()
//            );
//          },
        ),
    );
  }
}