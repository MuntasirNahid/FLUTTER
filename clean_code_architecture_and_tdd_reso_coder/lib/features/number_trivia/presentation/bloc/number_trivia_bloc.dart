import 'package:bloc/bloc.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/core/error/failures.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/core/usecases/usecase.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/core/util/input_converter.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

const String SERVER_FAIURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = "Cache Failure";
const String INVALID_INPUT_FAILURE_MESSAGE =
    "Invalid Input - The number must be a positive integer or zero";

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc({
    required this.getConcreteNumberTrivia,
    required this.getRandomNumberTrivia,
    required this.inputConverter,
  }) : super(Empty()) {
    on<NumberTriviaEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetTriviaForConcreteNumber>(_concreteTriviaEventHandler);
    on<GetTriviaForRandomNumber>(_randomTriviaEventHandler);
  }

  Future<void> _concreteTriviaEventHandler(
    GetTriviaForConcreteNumber event,
    Emitter<NumberTriviaState> emit,
  ) async {
    final stringNumber = event.numberString;

    final inputEither =
        inputConverter.stringToUnsignedInteger(event.numberString);

    await inputEither.fold(
        (failure) async => emit(
              Error(
                message: INVALID_INPUT_FAILURE_MESSAGE,
              ),
            ), (integer) async {
      emit(Loading());

      final params = Params(number: integer);
      final either = await getConcreteNumberTrivia(params);

      _emitNumberTriviaRetrievalResult(either, emit);
    });
  }

  Future<void> _randomTriviaEventHandler(
    GetTriviaForRandomNumber event,
    Emitter<NumberTriviaState> emit,
  ) async {
    emit(Loading());

    final either = await getRandomNumberTrivia(NoParams());

    _emitNumberTriviaRetrievalResult(either, emit);
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAIURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }

  void _emitNumberTriviaRetrievalResult(
    Either<Failure, NumberTrivia> either,
    Emitter<NumberTriviaState> emit,
  ) async {
    await either.fold(
      (failure) async {
        emit(
          Error(
            message: _mapFailureToMessage(failure),
          ),
        );
      },
      (trivia) async {
        emit(
          Loaded(
            trivia: trivia,
          ),
        );
      },
    );
  }
}
