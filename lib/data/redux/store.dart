import 'package:redux/redux.dart';
import 'package:todo/data/redux/app_state.dart';
import 'package:todo/data/redux/epics.dart';
import 'package:todo/data/redux/app_reducer.dart';

Store<AppState> createDefaultStore() => Store<AppState>(appStateReducer, initialState: AppState.initial(), middleware: [epicMiddleware]);