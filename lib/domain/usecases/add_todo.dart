///
/// Created by brian.ha289 on 2/Nov/2021
///
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/error/failures.dart';
import 'package:todo_app/core/usecases/usecase.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';

class AddTodo implements UseCase<void, AddTodoParams> {
  final TodosRepository todoRepository;

  AddTodo(this.todoRepository);

  @override
  Future<Either<Failure, void>> call(AddTodoParams params) {
    Todo todo = Todo(task: params.task, note: params.note);
    return todoRepository.addNewTodo(todo);
  }
}

class AddTodoParams extends Equatable {
  final String task;
  final String? note;
  const AddTodoParams({required this.task, this.note});

  @override
  List<Object> get props => [task];
}
