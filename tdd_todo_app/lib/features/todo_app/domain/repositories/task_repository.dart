import 'dart:async';

import '../entities/task.dart';

abstract class TaskRepositoryContract {
  Future<bool> add(Task task);
  Future<bool> delete(Task task);
  Future<bool> update(Task task);
  Future<Task> findOne(int id);
  Future<List<Task>> getAll();
}
