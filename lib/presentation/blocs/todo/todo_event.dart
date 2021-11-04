///
/// Created by brian.ha289 on 2/Nov/2021
///
part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class GetTodoListEvent extends TodoEvent {}

class DeleteTodoEvent extends TodoEvent {
  final String id;

  const DeleteTodoEvent(this.id);

  @override
  List<Object> get props => [id];
}

class TodoUpdateEvent extends TodoEvent {
  final Todo todo;
  const TodoUpdateEvent(this.todo);
  @override
  List<Object> get props => [todo];
}
