import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_todo_app/features/todo_app/data/repositories/task_repository.dart';
import 'package:tdd_todo_app/features/todo_app/domain/entities/task.dart';
import 'package:tdd_todo_app/features/todo_app/domain/repositories/task_repository.dart';

void main() {
  addTest();
  deleteTest();
  findOneTest();
  updateTest();
  getAllTest();
}

void getAllTest() async {
  TaskRepositoryContract taskRepository = new TaskRepository();
  test(
    'should get all the task from the repository',
    () async {
      // arrange
      Task task = Task(
        id: 0,
        added: new DateTime(2017, 9, 9, 9),
        isDone: false,
        text: "ceva",
      );
      final noneFound = await taskRepository.getAll();
      expect(noneFound.length, 0);
      taskRepository.add(task);
      final foundFirst = await taskRepository.getAll();
      expect(foundFirst[0], task);
      Task task2 = Task(
        id: 1,
        added: new DateTime(2018, 9, 9, 9),
        isDone: true,
        text: "altceva",
      );
      taskRepository.add(task2);
      final foundSecondOne = await taskRepository.getAll();
      expect(foundSecondOne[1], task2);
      final theRightLength = foundSecondOne.length;
      expect(theRightLength, 2);
    },
  );
}

void updateTest() async {
  TaskRepositoryContract taskRepository = new TaskRepository();
  test(
    'should update a task',
    () async {
      // arrange
      Task task = Task(
        id: 0,
        added: new DateTime(2017, 9, 9, 9),
        isDone: false,
        text: "ceva",
      );
      final notFoundForUpdate = await taskRepository.update(task);
      expect(notFoundForUpdate, false);
      taskRepository.add(task);
      Task taskUpdated = Task(
        id: 0,
        added: new DateTime(2017, 9, 9, 9),
        isDone: false,
        text: "altceva",
      );
      final isfoundForUpdate = await taskRepository.update(taskUpdated);
      expect(isfoundForUpdate, true);
      final isUpdatedCorectly = await taskRepository.findOne(0);
      expect(isUpdatedCorectly, taskUpdated);
      final checkIfUpdatedNotAdded = await taskRepository.getAll();
      expect(checkIfUpdatedNotAdded.length, 1);
    },
  );
}

void findOneTest() async {
  TaskRepositoryContract taskRepository = new TaskRepository();
  test(
    'should find a task',
    () async {
      // arrange
      Task task = Task(
        id: 0,
        added: new DateTime(2017, 9, 9, 9),
        isDone: false,
        text: "ceva",
      );
      taskRepository.add(task);
      // act
      Task foundTask = await taskRepository.findOne(0);
      // assert
      expect(foundTask, task);
      Task unfoundTask = await taskRepository.findOne(-1);
      expect(unfoundTask, null);
    },
  );
}

void deleteTest() async {
  TaskRepositoryContract taskRepository = new TaskRepository();
  test(
    'should delete a task',
    () async {
      // arrange
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
