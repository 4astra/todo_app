///
/// Created by brian.ha289 on 2/Nov/2021
///
part of 'todo_form_bloc.dart';

abstract class TodoFormEvent extends Equatable {
  const TodoFormEvent();

  @override
  List<Object> get props => [];
}

class TodoFormAddEvent extends TodoFormEvent {
  final String task;
  final String? note;

  const TodoFormAddEvent({required this.task, this.note});

  @override
  List<Object> get props => [task];
}

class TodoFormEditEvent extends TodoFormEvent {
  final Todo todo;
  const TodoFormEditEvent({required this.todo});
  
  @override
  List<Object> get props => [todo];
}
