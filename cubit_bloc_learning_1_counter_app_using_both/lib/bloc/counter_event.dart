part of 'counter_bloc.dart';

sealed class CounterEvent {} //our parent class

final class CounterIncremented extends CounterEvent {} //our event

final class CounterDecremented extends CounterEvent {}
