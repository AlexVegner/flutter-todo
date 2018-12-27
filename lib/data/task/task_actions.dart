import 'package:todo/data/redux/actions.dart';
import 'package:todo/data/task/task_contract.dart';
import 'package:todo/data/task/task_model.dart';

class TaskActions extends ModelCollection<Task> {

  @override
  TaskInitAction init() => TaskInitAction();

  @override
  TaskCreateAction create(Task model) => TaskCreateAction(model);

  @override
  TaskUpdateAction update(Task model) => TaskUpdateAction(model);

  @override
  TaskDeleteAction delete(Task model) => TaskDeleteAction(model);

  @override
  Action getAll() => TaskGetAllAction();

  @override
  Action<String> getId(String id) => TaskGetIdAction(id);

  @override
  TaskCreateStateAction stateCreate(Task model) => TaskCreateStateAction(model);

  @override
  TaskUpdateStateAction stateUpdate(Task model) => TaskUpdateStateAction(model);

  @override
  TaskDeleteStateAction stateDelete(Task model) => TaskDeleteStateAction(model);

  @override
  Action<List<Task>> stateGetAll(List<Task> list) => TaskGetAllStateAction(list);

  @override
  Action<Task> stateGetId(Task model) => TaskGetIdStateAction(model);  
}

class TaskInitAction extends Action with TaskContract {
  TaskInitAction() : super(null);
}

class TaskCreateAction extends Action<Task> with TaskContract {
  TaskCreateAction(Task value) : super(value);
}

class TaskUpdateAction extends Action<Task> with TaskContract {
  TaskUpdateAction(Task value) : super(value);
}

class TaskDeleteAction extends Action<Task> with TaskContract {
  TaskDeleteAction(Task value) : super(value);
}

class TaskGetAllAction extends Action with TaskContract {
  TaskGetAllAction() : super(null);
}

class TaskGetIdAction extends Action<String> with TaskContract {
  TaskGetIdAction(String id) : super(id);
}

class TaskCreateStateAction extends Action<Task> with TaskContract {
  TaskCreateStateAction(Task value) : super(value);
}

class TaskUpdateStateAction extends Action<Task> with TaskContract {
  TaskUpdateStateAction(Task value) : super(value);
}

class TaskDeleteStateAction extends Action<Task> with TaskContract {
  TaskDeleteStateAction(Task value) : super(value);
}

class TaskGetAllStateAction extends Action<List<Task>> with TaskContract {
  TaskGetAllStateAction(List<Task> value) : super(value);
}

class TaskGetIdStateAction extends Action<Task> with TaskContract {
  TaskGetIdStateAction(Task value) : super(value);
}