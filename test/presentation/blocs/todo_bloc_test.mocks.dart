///
/// Created by brian.ha289 on 3/Nov/2021
///
import 'dart:async' as _import5;
import 'package:dartz/dartz.dart' as _import3;
import 'package:todo_app/core/error/failures.dart' as _import6;
import 'package:todo_app/core/usecases/usecase.dart' as _import8;
import 'package:todo_app/data/models/models.dart' as _import7;
import 'package:todo_app/domain/repositories/todo_repository.dart' as _import2;
import 'package:todo_app/domain/usecases/usecases.dart' as _import4;
import 'package:mockito/mockito.dart' as _import1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeTodoRepository_0 extends _import1.Fake
    implements _import2.TodosRepository {}

class _FakeEither_1<L, R> extends _import1.Fake
    implements _import3.Either<L, R> {}

/// A class which mocks [GetAllTodo].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllTodo extends _import1.Mock implements _import4.GetAllTodo {
  MockGetAllTodo() {
    _import1.throwOnMissingStub(this);
  }

  @override
  _import2.TodosRepository get todoRepository =>
      (super.noSuchMethod(Invocation.getter(#todoRepository),
          returnValue: _FakeTodoRepository_0()) as _import2.TodosRepository);
  @override
  _import5.Future<_import3.Either<_import6.Failure, List<_import7.Todo>>> call(
          _import8.NoParams? noParams) =>
      (super.noSuchMethod(Invocation.method(#call, [noParams]),
              returnValue: Future<
                      _import3
                          .Either<_import6.Failure, List<_import7.Todo>>>.value(
                  _FakeEither_1<_import6.Failure, List<_import7.Todo>>()))
          as _import5
              .Future<_import3.Either<_import6.Failure, List<_import7.Todo>>>);
}

/// A class which mocks [EditTodo].
///
/// See the documentation for Mockito's code generation for more information.
class MockEditTodo extends _import1.Mock implements _import4.EditTodo {
  MockEditTodo() {
    _import1.throwOnMissingStub(this);
  }
  @override
  _import2.TodosRepository get todoRepository =>
      (super.noSuchMethod(Invocation.getter(#todoRepository),
          returnValue: _FakeTodoRepository_0()) as _import2.TodosRepository);
  @override
  _import5.Future<_import3.Either<_import6.Failure, _import7.Todo>> call(
          _import4.EditTodoParams? editTodoParams) =>
      (super.noSuchMethod(Invocation.method(#call, [editTodoParams]),
              returnValue: Future<
                      _import3
                          .Either<_import6.Failure, _import7.Todo>>.value(
                  _FakeEither_1<_import6.Failure, _import7.Todo>()))
          as _import5
              .Future<_import3.Either<_import6.Failure, _import7.Todo>>);
}