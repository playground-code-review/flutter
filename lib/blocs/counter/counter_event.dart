part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounter extends CounterEvent {
  const IncrementCounter(this.index);

  final num index;

  @override
  List<Object> get props => [index];
}

class DecrementCounter extends CounterEvent {
  const DecrementCounter(this.index);

  final num index;

  @override
  List<Object> get props => [index];
}

class ResetCounter extends CounterEvent {
  const ResetCounter();

  @override
  List<Object> get props => [];
}
