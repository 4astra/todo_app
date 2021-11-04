///
/// Created by brian.ha289 on 2/Nov/2021
///
import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/failures.dart';

import '../../data/models/models.dart';

abstract class TodosRepository {
  Future<Either<Failure, Todo>> getTodo(String id);

  Future<Either<Failure, List<Todo>>> todos();

  Future<Either<Failure, Todo>> addNewTodo(Todo todo);

  Future<Either<Failure, void>> deleteTodo(Todo todo);

  Future<Either<Failure, Todo>> updateTodo(Todo todo);
}
