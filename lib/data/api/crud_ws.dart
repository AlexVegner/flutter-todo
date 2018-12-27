import 'dart:async';

abstract class CrudWS<T> {
  Future<List<T>> getAll();
  Future<T> getId(String id);
  Future<T> create(T entity);
  Future<T> update(T entity);
  Future<bool> delete(T entity);
}