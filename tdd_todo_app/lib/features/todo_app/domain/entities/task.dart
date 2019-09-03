import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Task extends Equatable {
  final int id;
  final String text;
  final DateTime added;
  final DateTime deadline;
  final DateTime finishDate;
  final bool isDone;

  Task(
      {@required this.id,
      @required this.text,
      @required this.added,
      this.deadline,
      this.finishDate,
      @required this.isDone})
      : super([id, text, added, deadline, finishDate, isDone]);
}
