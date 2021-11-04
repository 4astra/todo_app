///
/// Created by brian.ha289 on 2/Nov/2021
///
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/usecases/usecase.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/domain/usecases/edit_todo.dart';
import 'package:todo_app/domain/usecases/get_all_todo.dart';

part 'todo_state.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({required this.getAllTodo, required this.editTodo})
      : super(TodoInitialState());

  final GetAllTodo getAllTodo;
  final EditTodo editTodo;

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is GetTodoListEvent) {
      yield TodoLoadingState();
      final resultGetAll = await getAllTodo(NoParams());

      yield* resultGetAll.fold((failure) async* {
        yield TodoLoadFailedState();
      }, (success) async* {
        yield TodoLoadSuccessState(success);
      });
    } else if (event is TodoUpdateEvent) {
      yield TodoUpdateInitState();
      final resultUpdate = await editTodo(EditTodoParams(task: event.todo));
      yield* resultUpdate.fold((failure) async* {
        yield TodoUpdateFailState();
      }, (success) async* {
        yield TodoUpdateSuccessState();
      });
    }
  }

  @override
  void onTransition(Transition<TodoEvent, TodoState> transition) {
    super.onTransition(transition);
  }
}
