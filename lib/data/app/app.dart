import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:todo/data/redux/actions.dart';
import 'package:todo/data/redux/app_state.dart';
import 'package:todo/data/task/task_helper.dart';

class App {
  static App _singleton;

  factory App() {
    return _singleton;
  }

  final String appTitle = "Todo app";
  final Store<AppState> store;
  final GlobalKey<NavigatorState> navigatorKey;

  App.ini (this.store, this.navigatorKey) {
    _singleton = this;
  }

  NavigatorState get navigation => navigatorKey.currentState;
  
  void dispatch(Function dispatchFunc, Object object) {
    store.dispatch(dispatchFunc(object));
  }
}

typedef DispatchFunc<T> = Action<T> Function<T>(T o);