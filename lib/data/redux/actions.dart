import 'package:todo/data/redux/model_contract.dart';

abstract class ModelCollection<T> {

  Action init();
  Action<T> create(T model);
  Action<T> update(T model);
  Action<T> delete(T model);
  Action getAll();
  Action<String> getId(String id);
  Action<T> stateCreate(T model);
  Action<T> stateUpdate(T model);
  Action<T> stateDelete(T model);
  Action<List<T>> stateGetAll(List<T> list);
  Action<T> stateGetId(T model);
}

abstract class Action<T> with ModelContract {
  final T item;

  Action(this.item);
}