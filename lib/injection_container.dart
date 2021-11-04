///
/// Created by brian.ha289 on 2/Nov/2021
///
import 'package:get_it/get_it.dart';
import 'package:todo_app/data/datasource/local_data.dart';
import 'package:todo_app/data/respositories/todo_repository.dart';
import 'package:todo_app/domain/repositories/repositories.dart';
import 'package:todo_app/domain/usecases/usecases.dart';
import 'package:todo_app/presentation/blocs/blocs.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Bloc
  getIt.registerFactory<TodoBloc>(
    () => TodoBloc(getAllTodo: getIt(), editTodo: getIt()),
  );
  getIt.registerFactory<TodoFormBloc>(
      () => TodoFormBloc(addTodo: getIt(), editTodo: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetAllTodo(getIt()));
  getIt.registerLazySingleton(() => AddTodo(getIt()));
  getIt.registerLazySingleton(() => EditTodo(getIt()));

  // Repository
  getIt.registerLazySingleton<TodosRepository>(
    () => TodosRepositoryImp(localData: getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<LocalData>(() => LocalDataImp());
}
