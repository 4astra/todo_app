///
/// Created by brian.ha289 on 2/Nov/2021
///
import 'package:uuid/uuid.dart';
import '../../domain/entities/entities.dart';

class Todo {
  final String id;
  final bool complete;
  final String note;
  final String task;

  Todo({
    required this.task,
    this.complete = false,
    String? id,
    String? note = '',
  })  : note = note ?? '',
        id = id ?? const Uuid().v4();

  String getTask() {
    return task;
  }

  Todo copyWith({bool? complete, String? note, String? task}) {
    return Todo(
      id: id,
      task: task ?? this.task,
      complete: complete ?? this.complete,
      note: note ?? this.note,
    );
  }

  @override
  int get hashCode {
    return complete.hashCode ^ task.hashCode ^ note.hashCode ^ id.hashCode;
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Todo &&
            runtimeType == other.runtimeType &&
            complete == other.complete &&
            task == other.task &&
            note == other.note &&
            id == other.id;
  }

  @override
  String toString() {
    return 'Todo{complete: $complete, task: $task, note: $note, id: $id}';
  }

  TodoEntity toEntity() {
    return TodoEntity(
      id: id,
      task: task,
      complete: complete,
      note: note,
    );
  }

  static Todo fromEntity(TodoEntity entity) {
    return Todo(
      id: entity.id,
      task: entity.task,
      complete: entity.complete,
      note: entity.note,
    );
  }
}
