///
/// Created by brian.ha289 on 2/Nov/2021
///
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/error/failures.dart';
import 'package:todo_app/core/usecases/usecase.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';

class EditTodo implements UseCase<void, EditTodoParams> {
  final TodosRepository todoRepository;

  EditTodo(this.todoRepository);

  @override
  Future<Either<Failure, Todo>> call(EditTodoParams params) {
    return todoRepository.updateTodo(params.task);
  }
}

class EditTodoParams extends Equatable {
  final Todo task;
  const EditTodoParams({required this.task});

  @override
  List<Object> get props => [task];
}
