import 'package:flutter/material.dart';
import 'package:todo/data/app/app.dart';
import 'package:todo/data/task/task_helper.dart';
import 'package:todo/data/task/task_model.dart';
import 'package:todo/pages/tasks/task_list_view_model.dart';

class TaskListItemWidget extends StatelessWidget {

  final Task task;
  final TaskListViewModel viewModel;

  TaskListItemWidget(this.task, this.viewModel);

  void _delete() {
    viewModel.delete(task);
  }

  void _edit(BuildContext context) {
    Navigator.pushNamed<bool>(context, "/task/${task.id}");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(32.0),
        child: Row(
          children: <Widget>[
            Text(task.name),
            Spacer(),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => _edit(context),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _delete(),
            )
          ],
        )
      )
    );
  }

}