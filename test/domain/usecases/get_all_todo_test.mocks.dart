///
/// Created by brian.ha289 on 3/Nov/2021
///
import 'dart:async' as _import4;

import 'package:dartz/dartz.dart' as _import2;
import 'package:todo_app/core/error/failures.dart' as _import5;
import 'package:todo_app/data/models/todo.dart' as _import6;
import 'package:todo_app/domain/repositories/todo_repository.dart' as _import3;
import 'package:mockito/mockito.dart' as _import1;

// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _import1.Fake
    implements _import2.Either<L, R> {}

/// A class which mocks [TodoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoRepository extends _import1.Mock
    implements _import3.TodosRepository {
  MockTodoRepository() {
    _import1.throwOnMissingStub(this);
  }

  @override
  _import4.Future<_import2.Either<_import5.Failure, _import6.Todo>> getTodo(
          String id) =>
      (super.noSuchMethod(Invocation.method(#getTodo, [id]),
          returnValue:
              Future<_import2.Either<_import5.Failure, _import6.Todo>>.value(
                  _FakeEither_0<_import5.Failure, _import6.Todo>())) as _import4
          .Future<_import2.Either<_import5.Failure, _import6.Todo>>);

  @override
  _import4.Future<_import2.Either<_import5.Failure, List<_import6.Todo>>>
      todos() => (super.noSuchMethod(Invocation.method(#todos, []),
              returnValue: Future<
                      _import2
                          .Either<_import5.Failure, List<_import6.Todo>>>.value(
                  _FakeEither_0<_import5.Failure, List<_import6.Todo>>()))
          as _import4
              .Future<_import2.Either<_import5.Failure, List<_import6.Todo>>>);

  @override
  _import4.Future<_import2.Either<_import5.Failure, _import6.Todo>> addTodo(
          _import6.Todo todo) =>
      (super.noSuchMethod(Invocation.method(#addTodo, [todo]),
          returnValue:
              Future<_import2.Either<_import5.Failure, _import6.Todo>>.value(
                  _FakeEither_0<_import5.Failure, _import6.Todo>())) as _import4
          .Future<_import2.Either<_import5.Failure, _import6.Todo>>);
}
