///
/// Created by brian.ha289 on 2/Nov/2021
///
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/blocs/blocs.dart';
import 'package:todo_app/presentation/widgets/widgets.dart';
import 'injection_container.dart' as ic;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ic.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TodoBloc>(
            create: (context) => getIt<TodoBloc>()..add(GetTodoListEvent())),
        BlocProvider<TodoFormBloc>(create: (context) => getIt<TodoFormBloc>())
      ],
      child: const MaterialApp(
        home: TabBarBottom(),
      ),
    ),
  );
}
