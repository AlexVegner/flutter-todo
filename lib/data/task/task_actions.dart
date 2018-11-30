import 'package:todo/data/redux/actions.dart';
import 'package:todo/data/task/task_contract.dart';
import 'package:todo/data/task/task_model.dart';
import 'package:todo/data/redux/model_contract.dart';

class TaskActions extends ModelCollection<Task> {
  @override
  TaskCreateAction create(Task model) => TaskCreateAction(model);

  @override
  TaskUpdateAction update(Task model) => TaskUpdateAction(model);

  @override
  TaskDeleteAction delete(Task model) => TaskDeleteAction(model);

  @override
  TaskCreateStateAction stateCreate(Task model) => TaskCreateStateAction(model);

  @override
  TaskUpdateStateAction stateUpdate(Task model) => TaskUpdateStateAction(model);

  @override
  TaskDeleteStateAction stateDelete(Task model) => TaskDeleteStateAction(model);
}

class TaskCreateAction extends Action<Task> with ModelContract, TaskContract {
  TaskCreateAction(Task value) : super(value);
}

class TaskUpdateAction extends Action<Task> with ModelContract, TaskContract {
  TaskUpdateAction(Task value) : super(value);
}

class TaskDeleteAction extends Action<Task> with ModelContract, TaskContract {
  TaskDeleteAction(Task value) : super(value);
}

class TaskCreateStateAction extends Action<Task> with ModelContract, TaskContract {
  TaskCreateStateAction(Task value) : super(value);
}

class TaskUpdateStateAction extends Action<Task> with ModelContract, TaskContract {
  TaskUpdateStateAction(Task value) : super(value);
}

class TaskDeleteStateAction extends Action<Task> with ModelContract, TaskContract {
  TaskDeleteStateAction(Task value) : super(value);
}
