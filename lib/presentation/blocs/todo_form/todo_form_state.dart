///
/// Created by brian.ha289 on 2/Nov/2021
///
part of 'todo_form_bloc.dart';

abstract class TodoFormState extends Equatable {
  const TodoFormState();

  @override
  List<Object> get props => [];
}

class TodoFormInitialState extends TodoFormState {}

class TodoFormAddSuccessState extends TodoFormState {}

class TodoFormAddFailState extends TodoFormState {}

class TodoFormLoadingState extends TodoFormState {}

class TodoFormUpdateFailState extends TodoFormState {}

class TodoFormUpdateSuccessState extends TodoFormState {}
