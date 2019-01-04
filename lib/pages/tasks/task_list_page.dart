import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo/data/app/app.dart';
import 'package:todo/data/redux/app_state.dart';
import 'package:todo/data/task/task_actions.dart';
import 'package:todo/data/task/task_helper.dart';
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
      builder: (context, viewModel) {
        if (viewModel.error != null) {}

        return TaskListWidget(viewModel);
      },
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
  void _create() {
    Navigator.pushNamed<bool>(context, "/task/create");
  }

  bool _isErrorShow = false;

  void _showError() {
    _isErrorShow = true;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(widget.viewModel.error.title),
            actions: <Widget>[
              FloatingActionButton(
                child: Text("Ok"),
                onPressed: () {
                  App().dispatchAction(TaskServerErrorAction(null));
                  Navigator.of(context).pop();
                  _isErrorShow = false;
                },
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }

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
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _create,
        tooltip: 'Create',
        child: new Icon(Icons.add),
      ),
    );
  }

  @override
  void didUpdateWidget(TaskListWidget oldWidget) {
    if (widget.viewModel.error != null && !_isErrorShow) {
      Future.delayed(Duration.zero, () {
        _showError();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  
}
