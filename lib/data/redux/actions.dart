import 'package:todo/data/redux/model_contract.dart';

abstract class ModelCollection<T> {
  Action<T> create(T model);
  Action<T> update(T model);
  Action<T> delete(T model);
  Action<T> stateCreate(T model);
  Action<T> stateUpdate(T model);
  Action<T> stateDelete(T model);
}

abstract class Action<T> with ModelContract {
  final T item;

  Action(this.item);
}