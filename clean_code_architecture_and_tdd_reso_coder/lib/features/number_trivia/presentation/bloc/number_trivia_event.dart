part of 'number_trivia_bloc.dart';

abstract class NumberTriviaEvent extends Equatable {
  const NumberTriviaEvent();
}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  ///Events are dispatched from the Widgets. The widget into which the user writes a number will be a TextField.
  ///A value held inside a TextField is always a String.
  final String numberString;

  GetTriviaForConcreteNumber(this.numberString);

  @override
  // TODO: implement props
  List<Object?> get props => [numberString];
}

class GetTriviaForRandomNumbr extends NumberTriviaEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
