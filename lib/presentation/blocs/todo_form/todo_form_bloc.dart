///
/// Created by brian.ha289 on 2/Nov/2021
///
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/domain/usecases/add_todo.dart';
import 'package:todo_app/domain/usecases/edit_todo.dart';

part 'todo_form_event.dart';
part 'todo_form_state.dart';

class TodoFormBloc extends Bloc<TodoFormEvent, TodoFormState> {
  TodoFormBloc({required this.addTodo, required this.editTodo})
      : super(TodoFormInitialState()) {
    // ignore: avoid_print
    // print("TodoFormBloc : constructor");
  }

  final AddTodo addTodo;
  final EditTodo editTodo;

  @override
  Stream<TodoFormState> mapEventToState(
    TodoFormEvent event,
  ) async* {
    if (event is TodoFormAddEvent) {
      final resultAdd =
          await addTodo(AddTodoParams(task: event.task, note: event.note));
      yield resultAdd.fold(
          (l) => TodoFormAddFailState(), (r) => TodoFormAddSuccessState());
    } else if (event is TodoFormEditEvent) {
      final resultUpdate = await editTodo(EditTodoParams(task: event.todo));
      yield resultUpdate.fold((l) => TodoFormUpdateFailState(),
          (r) => TodoFormUpdateSuccessState());
    }
  }

  @override
  void onTransition(Transition<TodoFormEvent, TodoFormState> transition) {
    // ignore: avoid_print
    // print("TodoFormBloc : $transition");
    super.onTransition(transition);
  }
}
