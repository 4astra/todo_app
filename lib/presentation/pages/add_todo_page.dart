///
/// Created by brian.ha289 on 2/Nov/2021
///
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/presentation/blocs/blocs.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const AddTodoPage());
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class AddEditScreen extends StatefulWidget {
  final bool isEditing;
  final Todo? todo;

  const AddEditScreen({Key? key, required this.isEditing, this.todo})
      : super(key: key);

  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _task = '';
  String _note = '';

  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Todo' : 'Add New Todo',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: isEditing ? widget.todo!.task : '',
                autofocus: !isEditing,
                style: textTheme.headline5,
                decoration: const InputDecoration(
                  hintText: "Todo title",
                ),
                validator: (val) {
                  if (val == null) {
                    return "Title is not empty";
                  }
                  return val.trim().isEmpty ? "Title is not empty" : null;
                },
                onSaved: (value) => _task = value ?? '',
              ),
              const Padding(
                  padding: EdgeInsets.all(16.0), child: SizedBox.shrink()),
              TextFormField(
                initialValue: isEditing ? widget.todo!.note : '',
                maxLines: 10,
                style: textTheme.subtitle1,
                decoration: const InputDecoration(
                  hintText: 'Note todo',
                ),
                onSaved: (value) => _note = value ?? '',
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: isEditing ? 'Update' : 'Save',
        child: Icon(isEditing ? Icons.update : Icons.save),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            if (!isEditing) {
              BlocProvider.of<TodoFormBloc>(context)
                  .add(TodoFormAddEvent(task: _task, note: _note));
            } else {
              BlocProvider.of<TodoFormBloc>(context).add(TodoFormEditEvent(
                  todo: widget.todo!.copyWith(task: _task, note: _note)));
            }
            // Goback
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}
