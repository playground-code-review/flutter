import 'package:hooks_riverpod/all.dart';

import 'counter_model.dart';

final counterProvider = StateNotifierProvider((ref) => CounterStateNotifier());

class CounterStateNotifier extends StateNotifier<CounterModel> {
  int step = 1;
  int lowerLimit = 0;
  int upperLimit = 10;

  static final _initialState = CounterModel(0);

  CounterStateNotifier() : super(_initialState);

  /// Counter의 step, low/high limit 설정
  void configureCounter({step, lowerLimit, upperLimit}) {
    this.step = step ?? this.step;
    this.lowerLimit = lowerLimit ?? this.lowerLimit;
    this.upperLimit = upperLimit ?? this.upperLimit;
  }

  void increment() =>
      state = CounterModel((state.value + step).clamp(lowerLimit, upperLimit));
  void decrement() =>
      state = CounterModel((state.value - step).clamp(lowerLimit, upperLimit));
  void reset() => state = _initialState;
}
