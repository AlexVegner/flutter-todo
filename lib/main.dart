import 'package:flutter/material.dart';
import 'package:todo/data/app/app.dart';
import 'package:todo/data/navigation/navigation.dart';
import 'package:todo/data/navigation/router.dart';
import 'package:todo/data/redux/app_state.dart';
import 'package:todo/data/redux/store.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  final store = createDefaultStore();
  final navigatorKey = createNavigatorKey();

  final app = App.ini(store, navigatorKey);
  app.initEpics();

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
          home: Router.home,
          routes: Router.routes,
          onGenerateRoute: Router.onGenerateRoute,
          onUnknownRoute: Router.onUnknownRoute,
        ),
    );
  }
}