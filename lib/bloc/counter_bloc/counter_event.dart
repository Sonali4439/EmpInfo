part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class Incrament extends CounterEvent {
  final int? count;
  const Incrament({this.count});
}

class Decrement extends CounterEvent {
  final int? count;
  const Decrement({this.count});
}
