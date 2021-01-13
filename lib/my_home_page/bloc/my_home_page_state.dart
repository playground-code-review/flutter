part of 'my_home_page_bloc.dart';

@immutable
class MyHomePageState {
  final int num;

  MyHomePageState({this.num});

  factory MyHomePageState.empty() {
    return MyHomePageState(num: 0);
  }

  MyHomePageState update({int num}) {
    return copyWith(num: num);
  }

  MyHomePageState copyWith({int num}) {
    return MyHomePageState(num: num ?? this.num);
  }
}
