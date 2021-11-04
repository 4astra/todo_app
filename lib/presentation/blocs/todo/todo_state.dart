///
/// Created by brian.ha289 on 2/Nov/2021
///
part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoLoadSuccessState extends TodoState {
  final List<Todo> todoList;

  const TodoLoadSuccessState([this.todoList = const []]);

  @override
  List<Object> get props => [todoList];

  @override
  String toString() => 'TodosLoadSuccess { todos: $todoList }';
}

class TodoLoadFailedState extends TodoState {}

class TodoUpdateInitState extends TodoState {}

class TodoUpdateSuccessState extends TodoState {}

class TodoUpdateFailState extends TodoState {}
