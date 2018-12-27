import 'dart:async';
import 'dart:convert';
import 'package:todo/data/conf.dart';
import 'package:todo/data/task/task_model.dart';
import 'package:todo/data/api/client.dart' as client;
import 'package:todo/data/task/task_ws.dart';

const ENDPOINT = '$BASE_URI/v1/tasks';

class TaskWSRest implements TaskWS {

  @override
  Future<List<Task>> getAll() async {
    final response = await client.get(
      ENDPOINT,
    );
    print("___getAll_ ${json.decode(response.body)}");  
    Iterable<Map<String, dynamic>> iterable = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Task> tasks = iterable.map((Map<String, dynamic> model)=> Task.fromJson(model)).toList();
    return tasks;
  }

  @override
  Future<Task> getId(String id) async {
    final response = await client.get(
      '$ENDPOINT/{$id}',
    );
    return Task.fromJson(json.decode(response.body));
  }

  @override
  Future<Task> create(Task entity) async {
    final body = entity.toJson()
      ..remove(Task.FIELD_ID)
      ..remove(Task.FIELD_CREATED_DATE);
    print("___create, body: ${body}");
    final response = await client.post(
      ENDPOINT,
      body: body,
    );
    return Task.fromJson(json.decode(response.body));
  }

  @override
  Future<Task> update(Task entity) async {
    final body = entity.toJson()
      ..remove(Task.FIELD_ID);
    print("___update, body: ${body}");
    final response = await client.put(
      '$ENDPOINT/${entity.id}',
      body: body,
    );
    return Task.fromJson(json.decode(response.body));
  }

  @override
  Future<bool> delete(Task entity) async {
    await client.delete(
      '$ENDPOINT/${entity.id}',
    );
    return true;
  }  
}
