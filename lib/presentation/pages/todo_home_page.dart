///
/// Created by brian.ha289 on 2/Nov/2021
///
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/models/models.dart';
import 'package:todo_app/presentation/blocs/blocs.dart';
import 'package:todo_app/presentation/pages/pages.dart';
import 'package:todo_app/presentation/widgets/widgets.dart';

class TodoHomePage extends StatelessWidget {
  final VisibilityFilter visibilityFilter;
  const TodoHomePage({Key? key, required this.visibilityFilter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      if (state is TodoLoadSuccessState) {
        List<Todo> todos = [];

        if (visibilityFilter == VisibilityFilter.all) {
          todos = state.todoList;
          if (todos.isNotEmpty) {
            return _renderBody(context, todos);
          } else {
            return _renderError(context, "There has any todos");
          }
        } else if (visibilityFilter == VisibilityFilter.active) {
          todos = state.todoList
              .where((element) => element.complete == false)
              .toList();
          if (todos.isNotEmpty) {
            return _renderBody(context, todos);
          } else {
            return _renderError(context, "There has no plan to todo");
          }
        } else {
          todos = state.todoList
              .where((element) => element.complete == true)
              .toList();
          if (todos.isNotEmpty) {
            return _renderBody(context, todos);
          } else {
            return _renderError(context, "There has no completed todo");
          }
        }
      } else {
        return const SizedBox.shrink();
      }
    });
  }

  Widget _renderBody(BuildContext context, List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = todos[index];

        return TodoItem(
          todo: todo,
          onDismissed: (direction) {},
          onTap: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return AddEditScreen(
                    isEditing: true,
                    todo: todo,
                  );
                },
              ),
            );
            context.read<TodoBloc>().add(GetTodoListEvent());
          },
          onCheckboxChanged: (_) async {
            BlocProvider.of<TodoBloc>(context).add(
              TodoUpdateEvent(todo.copyWith(complete: !todo.complete)),
            );
            context.read<TodoBloc>().add(GetTodoListEvent());
          },
        );
      },
    );
  }

  Widget _renderError(BuildContext context, String message) {
    return Center(
      child: Text(message),
    );
  }
}
