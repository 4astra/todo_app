///
/// Created by brian.ha289 on 2/Nov/2021
///
import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/failures.dart';
import 'package:todo_app/core/usecases/usecase.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/domain/repositories/repositories.dart';

class GetAllTodo implements UseCase<List<Todo>, NoParams> {
  final TodosRepository todoRepository;

  GetAllTodo(this.todoRepository);

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams noParams) async {
    return await todoRepository.todos();
  }
}
