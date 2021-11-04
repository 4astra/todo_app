///
/// Created by brian.ha289 on 2/Nov/2021
///
import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final String id;
  final bool complete;
  final String task;
  final String? note;

  const TodoEntity({
    required this.id,
    required this.task,
    required this.complete,
    this.note,
  });

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'task': task,
      'complete': complete,
      'note': note,
    };
  }

  @override
  List<Object?> get props => [id, task, complete, note];

  @override
  String toString() {
    return 'TodoEntity { complete: $complete, task: $task, note: $note, id: $id }';
  }

  static TodoEntity fromJson(Map<String, Object> json) {
    return TodoEntity(
      id: json['id'] as String,
      task: json['task'] as String,
      complete: json['complete'] as bool,
      note: json['note'] as String?,
    );
  }
}
