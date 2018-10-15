import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/data/app/app.dart';
import 'package:todo/data/task/task_helper.dart';
import 'package:todo/data/task/task_model.dart';
import 'package:todo/utils/task_generator.dart';
import 'package:todo/widgets/page_widget.dart';

class TaskEditPage extends StatefulWidget implements TitleProtocol {

  final Task task;

  TaskEditPage(this.task);

  @override
  State createState() => _StateTaskEditPage();

  @override
  String get title => 'Edit Task';
}

class _StateTaskEditPage extends State<TaskEditPage> {

  TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = new TextEditingController(text: widget.task.name ?? "");
  }

  void _save() {
    String name =  _nameController.text;
    if (widget.task.id != null) {
      App().dispatch(Tasks.actions.update, Task(name: name, id: widget.task.id));
    } else {
      App().dispatch(Tasks.actions.create, generateTask(name: name));
    }
    App().navigation.pop(true);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _save(),
        tooltip: 'Save',
        child: new Icon(Icons.save),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                child: Row(
                  children: <Widget>[
                    Text('Task name'),
                    Padding(padding: EdgeInsets.only(right: 10.0),),
                    Expanded(
                      child: TextField(
                        controller: _nameController,
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}