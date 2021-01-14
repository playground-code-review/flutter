import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _counter = 0;

  int get count => _counter;

  void incrementCounter() {
    _counter = (_counter + 2).clamp(0, 10);
    notifyListeners();
  }

  void decrementCounter() {
    _counter = (_counter - 2).clamp(0, 10);
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }
}
