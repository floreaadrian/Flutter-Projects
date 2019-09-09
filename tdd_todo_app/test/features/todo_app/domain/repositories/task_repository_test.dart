import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/flutter_test.dart' as prefix0;
import 'package:tdd_todo_app/features/todo_app/data/repositories/task_repository.dart';
import 'package:tdd_todo_app/features/todo_app/domain/entities/task.dart';
import 'package:tdd_todo_app/features/todo_app/domain/repositories/task_repository.dart';

void main() {
  addTest();
  deleteTest();
}

Future deleteTest() async {
  TaskRepositoryContract taskRepository = new TaskRepository();
  test(
    'should delete a task',
    () async {
      // arrange
      taskRepository = new TaskRepository();
      Task task = Task(
        id: 0,
        added: new DateTime(2017, 9, 9, 9),
        isDone: false,
        text: "ceva",
      );
      // act
      final deleteBeforeAdding = await taskRepository.delete(task);
      expect(deleteBeforeAdding, false);
      await taskRepository.add(task);
      final deleteAfterAdding = await taskRepository.delete(task);
      expect(deleteAfterAdding, true);
    },
  );
}

void addTest() async {
  TaskRepositoryContract taskRepository = new TaskRepository();
  test(
    'should add a task',
    () async {
      // arrange
      Task task = Task(
        id: 0,
        added: new DateTime(2017, 9, 9, 9),
        isDone: false,
        text: "ceva",
      );
      Task task1 = Task(
        id: 0,
        added: new DateTime(2017, 9, 9, 9),
        isDone: false,
        text: "ceva",
      );
      // act
      final bool added = await taskRepository.add(task);
      final bool addedSecondTime = await taskRepository.add(task1);
      // assert
      expect(added, true);
      expect(addedSecondTime, false);
    },
  );
}
