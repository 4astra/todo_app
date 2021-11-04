///
/// Created by brian.ha289 on 3/Nov/2021
///
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/error/failures.dart';
import 'package:todo_app/core/usecases/usecase.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/domain/usecases/usecases.dart';
import 'package:todo_app/presentation/blocs/blocs.dart';
import 'todo_bloc_test.mocks.dart';

@GenerateMocks([GetAllTodo])
void main() {
  late TodoBloc todoBloc;
  late MockGetAllTodo mockGetAllTodo;
  late MockEditTodo mockEditTodo;
  setUp(() {
    mockGetAllTodo = MockGetAllTodo();
    mockEditTodo = MockEditTodo();
    todoBloc = TodoBloc(getAllTodo: mockGetAllTodo, editTodo: mockEditTodo);
  });

  test("Initial state should be TodoInitialState", () async {
    // assert
    expect(todoBloc.state, equals(TodoInitialState()));
  });

  group("GetTodoListEvent", () {
    final List<Todo> allTodo = [
      Todo(task: "Hello Manabie", id: "abc-xyz"),
      Todo(task: "Study more Flutter and Dart", note: "Programming")
    ];

    test(
      "Should get all todos from GetAllTodo's use case",
      () async {
        // arrange
        when(mockGetAllTodo(any)).thenAnswer((_) async => Right(allTodo));
        // actual
        todoBloc.add(GetTodoListEvent());
        await untilCalled(mockGetAllTodo(NoParams()));
        // assert
        verify(mockGetAllTodo(NoParams()));
      },
    );

    test(
      'Should emit [TodoLoadingState, TodoLoadSuccessState] when data is gotten successfully',
      () async {
        // arrange
        when(mockGetAllTodo(any)).thenAnswer((_) async => Right(allTodo));
        // assert later
        final expected = [
          TodoLoadingState(),
          TodoLoadSuccessState(allTodo),
        ];
        expectLater(todoBloc.stream, emitsInOrder(expected));
        // actual
        todoBloc.add(GetTodoListEvent());
      },
    );

    final todo = Todo(task: "hello-world");

    test(
        "Should emit [TodoUpdateInitState, TodoUpdateSuccessState] when data was updated",
        () async {
      // arrange
      when(mockEditTodo(any)).thenAnswer((realInvocation) async => Right(todo));
      // assert later
      final expected = [TodoUpdateInitState(), TodoUpdateSuccessState()];
      expectLater(todoBloc.stream, emitsInOrder(expected));
      // act
      todoBloc.add(TodoUpdateEvent(todo.copyWith(complete: !todo.complete)));
    });

    test(
        "Should emit [TodoUpdateInitState, TodoUpdateFailState] when data is not updated",
        () async {
      // arrange
      when(mockEditTodo(any)).thenAnswer((realInvocation) async => Left(DataBaseFailure()));
      // assert later
      final expected = [TodoUpdateInitState(), TodoUpdateFailState()];
      expectLater(todoBloc.stream, emitsInOrder(expected));
      // act
      todoBloc.add(TodoUpdateEvent(todo.copyWith(complete: !todo.complete)));
    });

    test(
      'Should emit [TodoLoadingState, TodoLoadFailedState] when getting data fails',
      () async {
        // arrange
        when(mockGetAllTodo(any))
            .thenAnswer((_) async => Left(DataBaseFailure()));
        // assert later
        final expected = [
          TodoLoadingState(),
          TodoLoadFailedState(),
        ];
        expectLater(todoBloc.stream, emitsInOrder(expected));
        // act
        todoBloc.add(GetTodoListEvent());
      },
    );
  });
}
