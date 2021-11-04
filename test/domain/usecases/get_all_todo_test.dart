///
/// Created by brian.ha289 on 3/Nov/2021
///
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/usecases/usecase.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';
import 'package:todo_app/domain/usecases/usecases.dart';
import 'get_all_todo_test.mocks.dart';

@GenerateMocks([TodosRepository])
void main() {
  late MockTodoRepository mockTodoRepository;
  late GetAllTodo getAllTodo;
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    getAllTodo = GetAllTodo(mockTodoRepository);
  });

  final List<Todo> lstTodos = [
    Todo(
      task: 'task1',
      id: "abc",
    ),
    Todo(
      task: 'task2',
      id: "xyz",
    )
  ];

  test("should get all todo from the repository", () async {
    // arrange
    when(mockTodoRepository.todos()).thenAnswer((_) async => Right(lstTodos));
    // act
    final result = await getAllTodo(NoParams());
    // assert
    expect(result, Right(lstTodos));
    verify(mockTodoRepository.todos());
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
