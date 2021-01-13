import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_home_page_event.dart';
part 'my_home_page_state.dart';

class MyHomePageBloc extends Bloc<MyHomePageEvent, MyHomePageState> {
  MyHomePageBloc(MyHomePageState initialState) : super(initialState);

  @override
  MyHomePageState get initialState => MyHomePageState.empty();

  @override
  Stream<MyHomePageState> mapEventToState(MyHomePageEvent event) async* {

    if (event is PHomePageEvent) {
      yield* _mapPlusNumber(event);
    } else if (event is MHomePageEvent) {
      yield* _mapMinusNumber(event);
    } else if (event is RHomePageEvent) {
      yield* _mapReset(event);
    }
  }

  Stream<MyHomePageState> _mapPlusNumber(PHomePageEvent pageItem) async* {
    var number = (pageItem.num + 2).clamp(0, 10);
    yield state.update(num: number);
  }

  Stream<MyHomePageState> _mapMinusNumber(MHomePageEvent pageItem) async* {
    var number = (pageItem.num - 2).clamp(0, 10);
    yield state.update(num: number);
  }

  Stream<MyHomePageState> _mapReset(RHomePageEvent pageItem) async* {
    yield state.update(num: pageItem.num);
  }
}
