import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, num> {
  num _counter;
  static final num minCounter = 0;
  static final num maxCounter = 10;

  CounterBloc()
      : _counter = 0,
        super(0);

  @override
  Stream<num> mapEventToState(CounterEvent event) async* {
    if (event is ResetCounter) {
      yield* _mapResetCounter(event);
    } else if (event is IncrementCounter) {
      yield* _mapIncrementCounter(event);
    } else if (event is DecrementCounter) {
      yield* _mapDecrementCounter(event);
    }
  }

  Stream<num> _loadCount() async* {
    _counter = _counter.clamp(minCounter, maxCounter);
    yield _counter;
  }

  Stream<num> _mapResetCounter(ResetCounter event) async* {
    _counter = 0;
    yield* _loadCount();
  }

  Stream<num> _mapDecrementCounter(DecrementCounter event) async* {
    _counter -= event.index;
    yield* _loadCount();
  }

  Stream<num> _mapIncrementCounter(IncrementCounter event) async* {
    _counter += event.index;
    yield* _loadCount();
  }
}
