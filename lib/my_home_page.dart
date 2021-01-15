import 'package:flutter/material.dart';
import 'package:playground/count.dart';

import 'counter_page.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: CounterPage());
  }
}
