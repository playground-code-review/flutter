import 'package:flutter/material.dart';
import 'count.dart';

class CounterPage extends StatefulWidget {
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Count(
          count: count,
          onCountSelected: () {
            print("Count was selected.");
          },
          onCountChange: (int val) {
            setState(() => count += val);
          },
        ),
      );

  }
}
