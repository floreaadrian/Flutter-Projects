import 'package:tdd_todo_app/features/todo_app/domain/entities/task.dart';
import 'package:tdd_todo_app/features/todo_app/domain/repositories/task_repository.dart';

class TaskRepository extends TaskRepositoryContract {
  final List<Task> listOfTask = new List<Task>();

  @override
  Future<bool> add(Task task) async {
    if (checkIfTaskInList(task)) {
      return false;
    } else {
      listOfTask.add(task);
      return true;
    }
  }

  @override
  Future<bool> delete(Task task) async {
    if (checkIfTaskInList(task)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Task> findOne(int id) async {
    for (int i = 0; i < listOfTask.length; ++i)
      if (listOfTask[i].id == id) return listOfTask[i];
    return null;
  }

  @override
  Future<List<Task>> getAll() async {
    return listOfTask;
  }

  @override
  Future<bool> update(Task task) async {
    for (int i = 0; i < listOfTask.length; ++i)
      if (listOfTask[i].id == task.id) {
        listOfTask[i] = task;
        return true;
      }
    return false;
  }

  bool checkIfTaskInList(Task task) {
    for (int i = 0; i < listOfTask.length; ++i) {
      if (listOfTask[i] == task) {
        return true;
      }
    }
    return false;
  }
}
