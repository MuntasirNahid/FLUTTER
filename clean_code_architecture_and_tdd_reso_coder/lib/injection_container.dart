import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/util/input_converter.dart';
import 'features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'features/number_trivia/presentation/bloc/number_trivia_bloc.dart';

final service_locator = GetIt.instance;

Future<void> init() async {
  ///-------------/// Features

  //Bloc

  ///This will create and return completely new instance
  ///when we have something like disposable we will use it
  service_locator.registerFactory(
    () => NumberTriviaBloc(
      getConcreteNumberTrivia:
          service_locator(), //equivalent to service_locator.call()//it will find out on it's own
      getRandomNumberTrivia: service_locator(),
      inputConverter: service_locator(),
    ),
  );

  ///This will return the previouservice_locatory created instance through the app lifecycle

  // Use cases
  service_locator
      .registerLazySingleton(() => GetConcreteNumberTrivia(service_locator()));
  service_locator
      .registerLazySingleton(() => GetRandomNumberTrivia(service_locator()));

  //Repository
  service_locator.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      numberTriviaRemoteDataSource: service_locator(),
      numberTriviaLocalDataSource: service_locator(),
      networkInfo: service_locator(),
    ),
  );

  //Data sources

  service_locator.registerLazySingleton<NumberTriviaRemoteDataSource>(
    () => NumberTriviaRemoteDataSourceImpl(
      client: service_locator(),
    ),
  );

  service_locator.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTriviaLocalDataSourceImpl(
      sharedPreferences: service_locator(),
    ),
  );

  ///----------------------- ///core
  service_locator.registerLazySingleton(() => InputConverter());

  service_locator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      service_locator(),
    ),
  );

  ///---------------------///External
  final sharedPreferences = await SharedPreferences.getInstance();

  service_locator.registerLazySingleton(() => sharedPreferences);
  service_locator.registerLazySingleton(() => http.Client());
  service_locator.registerLazySingleton(() => DataConnectionChecker());
}
