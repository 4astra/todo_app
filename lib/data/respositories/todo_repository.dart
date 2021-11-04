import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/exceptions.dart';
import 'package:todo_app/core/error/failures.dart';
import 'package:todo_app/data/datasource/local_data.dart';
import '../models/models.dart';
import '../../domain/repositories/repositories.dart';

class TodosRepositoryImp extends TodosRepository {
  final LocalData localData;

  TodosRepositoryImp({required this.localData});

  @override
  Future<Either<Failure, Todo>> getTodo(String id) async {
    try {
      return Right(await localData.getTodo(id));
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Todo>>> todos() async {
    try {
      return Right(await localData.getAllTodo());
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, Todo>> addNewTodo(Todo todo) async {
    try {
      final Todo atodo = await localData.addTodo(todo);
      return Right(atodo);
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTodo(Todo todo) async {
    try {
      return Right(await localData.deleteTodo(todo));
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, Todo>> updateTodo(Todo todo) async {
    try {
      await localData.updateTodo(todo);
      return Right(todo);
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }
}
