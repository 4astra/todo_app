///
/// Created by brian.ha289 on 3/Nov/2021
///
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';
import 'package:todo_app/domain/usecases/usecases.dart';
import 'add_todo_test.mocks.dart';

@GenerateMocks([TodosRepository])
void main() {
  late MockTodoRepository mockTodoRepository;
  late AddTodo addTodo;
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    addTodo = AddTodo(mockTodoRepository);
  });
  const String task = "abc xin chao";
  final Todo newTodo = Todo(task: task, note: "abc xin chao");
  test("should add todo to the repository", () async {
    // arrange
    when(mockTodoRepository.addNewTodo(Todo(task: task, note: "abc xin chao")))
        .thenAnswer((_) async => Right(newTodo));
    // actual
    final result = await addTodo(const AddTodoParams(task: task));
    // assert
    expect(result, equals(Right(newTodo)));
  });
}
