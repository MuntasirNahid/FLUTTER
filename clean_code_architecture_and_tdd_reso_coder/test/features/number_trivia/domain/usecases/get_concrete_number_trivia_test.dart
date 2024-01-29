import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  //the usecase we want to test
  late GetConcreteNumberTrivia usecase;

  //mock of the abstract repo where usecase lies
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  //To operate with this NumberTriviaRepository instance, the GetConcreteNumberTrivia use case will get it passed in through a constructor.
  // Tests in Dart have a handy method called setUp which runs before every individual test. This is where we will instantiate the objects.
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test('should get trivia for the number from the repository', () async {
    //arrange
    when(() => mockNumberTriviaRepository.getConcreteNumberTrivia(any()))
        .thenAnswer((_) async => Right(tNumberTrivia));

    //act

    //usecase.execute or usecase.call( usecase )-same)
    final result = await usecase(Params(number: tNumber));

    //assert

    //we expect that our result will be type of NumberTrivia entity
    expect(result, Right(tNumberTrivia));

    //we are verifying that out usecase was called with the number we wanted to call
    verify(() => mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    //verifying that no more interaction are taking place in mockNumberTriv.Rep.
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
