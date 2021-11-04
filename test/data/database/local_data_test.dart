///
/// Created by brian.ha289 on 3/Nov/2021
///
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/core/error/exceptions.dart';
import 'package:todo_app/data/datasource/local_data.dart';
import 'package:todo_app/data/models/models.dart';

void main() {
  late LocalDataImp localDataImpl;
  // setup local database
  setUp(() {
    localDataImpl = LocalDataImp();
  });

  group("getTodo", () {
    test("should return a Todo if existed", () async {
      const String id = "abc-xyz";
      final Todo todo = Todo(task: "Hello Manabie", id: "abc-xyz");
      final expectTodo = await localDataImpl.getTodo(id);
      expect(todo, expectTodo);
    });

    test(
        "should throw Exception when there has no existed Todo with the given id",
        () async {
      String id = "abc";
      final call = localDataImpl.getTodo;
      // assert
      expect(() => call(id), throwsA(isInstanceOf<DataBaseException>()));
    });
  });
}
