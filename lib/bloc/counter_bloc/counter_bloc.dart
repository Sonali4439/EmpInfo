import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<Incrament>(_inc);
    on<Decrement>(_desc);
  }

  _inc(Incrament event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      count: event.count! + 1,
    ));
  }

  _desc(Decrement event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      count: event.count! - 1,
    ));
  }
}
