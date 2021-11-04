///
/// Created by brian.ha289 on 2/Nov/2021
///
///
import 'package:collection/collection.dart';
import 'package:todo_app/core/error/exceptions.dart';
import '../models/models.dart';

abstract class LocalData {
  Future<List<Todo>> getAllTodo();
  Future<Todo> addTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<Todo> getTodo(String id);
}

class LocalDataImp implements LocalData {
  LocalDataImp();

  final List<Todo> _list = [
    Todo(task: "Hello Manabie", id: "abc-xyz"),
    Todo(task: "Study more Flutter and Dart", note: "Programming")
  ];

  @override
  Future<List<Todo>> getAllTodo() async {
    return _list;
  }

  @override
  Future<Todo> addTodo(Todo todo) async {
    _list.add(todo);
    return todo;
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    _list.remove(todo);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    // final index = _list.indexWhere((element) => element.id == todo.id);
    // ignore: avoid_print
    // print("Index: $index");
    _list[_list.indexWhere((element) => element.id == todo.id)] = todo;
  }

  @override
  Future<Todo> getTodo(String id) async {
    final Todo? todoModel =
        _list.firstWhereOrNull((element) => element.id == id);
    if (todoModel != null) {
      return todoModel;
    } else {
      throw DataBaseException();
    }
  }
}
