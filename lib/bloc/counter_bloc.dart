import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is IncrementEvent) {
        counter = counter + 1;
        emit(CounterValueChangedState(counterValue: counter));
      } else if (event is DecrementEvent) {
        counter = counter - 1;
        emit(CounterValueChangedState(counterValue: counter));
      } else {
        counter = 0;
        emit(CounterValueChangedState(counterValue: counter));
      }
    });
  }
}
