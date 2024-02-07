import 'package:clean_code_architecture_and_tdd_reso_coder/core/network/network_info.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/core/util/input_converter.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///-------------/// Features

  //Bloc

  ///This will create and return completely new instance
  ///when we have something like disposable we will use it
  sl.registerFactory(
    () => NumberTriviaBloc(
      getConcreteNumberTrivia:
          sl(), //equivalent to sl.call()//it will find out on it's own
      getRandomNumberTrivia: sl(),
      inputConverter: sl(),
    ),
  );

  ///This will return the previously created instance through the app lifecycle

  // Use cases
  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

  //Repository
  sl.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      numberTriviaRemoteDataSource: sl(),
      numberTriviaLocalDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //Data sources

  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
    () => NumberTriviaRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTriviaLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  ///----------------------- ///core
  sl.registerLazySingleton(() => InputConverter());

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      sl(),
    ),
  );

  ///---------------------///External
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
