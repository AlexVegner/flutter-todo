import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo/data/redux/app_state.dart';
import 'package:todo/pages/page_widget.dart';
import 'package:todo/pages/tasks/task_list_view_model.dart';

class TaskListPage extends PageWidget {
  @override
  State createState() => _StateTaskListPage();

  @override
  String get title => 'Todo List';
}

class _StateTaskListPage extends State<TaskListPage> {

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
                child: new StoreConnector<AppState, TaskListViewModel>(
                  converter: (store) => TaskListViewModel(store),
                  builder: (context, viewModel) {
                    return ListView.builder(
                      itemCount: viewModel.tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        String name = viewModel.tasks[index].name;
                        return Row(
                          children: <Widget>[
                            Text(name),
                          ],
                        );
                      }
                    );
                  },
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

