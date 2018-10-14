import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo/data/redux/app_state.dart';
import 'package:todo/data/task/task_model.dart';
import 'package:todo/utils/task_generator.dart';
import 'package:todo/widgets/page_widget.dart';
import 'package:todo/pages/tasks/task_list_view_model.dart';
import 'package:todo/widgets/tasks/task_list_item.dart';

class TaskListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TaskListViewModel>(
      converter: (store) => TaskListViewModel(store),
      builder: (context, viewModel) => TaskListWidget(viewModel),
    );
  }
}

class TaskListWidget extends StatefulWidget implements TitleProtocol {
  final TaskListViewModel viewModel;

  TaskListWidget(this.viewModel);

  @override
  State createState() => _StateTaskListWidget();

  @override
  String get title => 'Todo List';
}

class _StateTaskListWidget extends State<TaskListWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    itemCount: widget.viewModel.tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Task task = widget.viewModel.tasks[index];
                      return TaskListItemWidget(task, widget.viewModel);
                    }
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => widget.viewModel.create(Task(name: generateName())),
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
