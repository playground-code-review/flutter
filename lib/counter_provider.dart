import 'package:flutter/cupertino.dart';

class CounterProvider with ChangeNotifier{
  int _counter = 0;

  int get counter => _counter;

  void increaseCounter(){
    _counter++;
    notifyListeners();
  }
}