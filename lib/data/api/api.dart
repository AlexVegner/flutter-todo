import 'package:todo/data/task/task_ws.dart';
import 'package:todo/data/task/task_ws_rest.dart';

class Api {
  static Api _singleton;

  factory Api() {
    if (_singleton == null) {
      _singleton = Api.ini(TaskWSRest());
    }
    return _singleton;
  }

  final TaskWS tasks;

  Api.ini (this.tasks) {
    _singleton = this;
  }
}