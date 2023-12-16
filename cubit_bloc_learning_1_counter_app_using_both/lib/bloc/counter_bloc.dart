import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart'; //we can also use import here,but
//using part makes them a single unit. so we can edit anywhere in the unit

//it needs event and state
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncremented>((event, emit) {
      emit(state + 1);
    });
    on<CounterDecremented>((event, emit) {
      if (state == 0) return;
      emit(state - 1);
    });
  }
}
