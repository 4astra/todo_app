///
/// Created by brian.ha289 on 3/Nov/2021
///
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/data/models/models.dart';
import 'package:todo_app/domain/entities/entities.dart';

void main() {
  const task = "Hello Manabie";
  final Todo todo = Todo(task: task);

  test("Todo's instance should be a subclass of Todo", () async {
    // assert
    expect(todo, isA<Todo>());
  });

  test("Todo's instance should not be a subclass of TodoEnityty",
      () => {expect(todo, isNot(isA<TodoEntity>()))});

  test(
      "Todo object should has ID generation", () => expect(todo.id, isNotNull));


  test("Task title is same as expecting", () => expect(todo.task, equalsIgnoringCase(task))); 

  test("Todo is not completd", () => expect(todo.complete, equals(false)));
}
