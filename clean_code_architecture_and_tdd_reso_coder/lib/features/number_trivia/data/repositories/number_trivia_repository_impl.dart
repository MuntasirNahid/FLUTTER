import 'package:clean_code_architecture_and_tdd_reso_coder/core/error/exceptions.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/core/error/failures.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/core/network/network_info.dart';

import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

typedef _ConcreteOrRandomChooser = Future<NumberTrivia> Function();

class NumberTriviaRepositoryImpl extends NumberTriviaRepository {
  final NumberTriviaRemoteDataSource numberTriviaRemoteDataSource;
  final NumberTriviaLocalDataSource numberTriviaLocalDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    required this.numberTriviaRemoteDataSource,
    required this.numberTriviaLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
    int number,
  ) async {
    return await _getTrivia(
      () => numberTriviaRemoteDataSource.getConcreteNumberTrivia(
        number,
      ),
    );
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    return _getTrivia(
      () => numberTriviaRemoteDataSource.getRandomNumberTrivia(),
    );
  }

  Future<Either<Failure, NumberTrivia>> _getTrivia(
      _ConcreteOrRandomChooser getConcreteOrRandom) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await getConcreteOrRandom();
        numberTriviaLocalDataSource.cacheNumberTrivia(
          remoteTrivia as NumberTriviaModel,
        );
        return Right(remoteTrivia);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia =
            await numberTriviaLocalDataSource.getLastNumberTrivia();

        return Right(localTrivia);
      } on CacheExceptions {
        return Left(CacheFailure());
      }
    }
  }
}
