part of 'my_home_page_bloc.dart';

@immutable
abstract class MyHomePageEvent {}

class PHomePageEvent extends MyHomePageEvent {
  final int num;

  PHomePageEvent({this.num});
}

class MHomePageEvent extends MyHomePageEvent {
  final int num;

  MHomePageEvent({this.num});
}

class RHomePageEvent extends MyHomePageEvent {
  final int num;

  RHomePageEvent({this.num});
}
