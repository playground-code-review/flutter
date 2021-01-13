import 'package:flutter/material.dart';
import 'dart:core';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _min = 0;
  int _max = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            this._buildCounterText(),
            this._buildDecreaseCounterBy2(),
            this._buildClearCounter(),
          ],
        ),
      ),
      floatingActionButton: this._buildFloatingButton(),
    );
  }

  /// _counter 글자 위젯.
  Text _buildCounterText() {
    return Text(
      '$_counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }

  /// _counter 텍스트 상태 관리.
  void setCounterText() {
    setState(() {
      this._counter = this._counter.clamp(_min, _max);
    });
  }

  /// 2씩 증가하는 floating 버튼 위젯.
  FloatingActionButton _buildFloatingButton() {
    return FloatingActionButton(
      onPressed: () {
        this._counter += 2;
        this.setCounterText();
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }

  /// 2씩 감소 하는 버튼 위젯.
  RaisedButton _buildDecreaseCounterBy2() {
    return RaisedButton(
      onPressed: () {
        this._counter -= 2;
        this.setCounterText();
      },
      color: Colors.red[400],
      textColor: Colors.white,
      child: Text("-2"),
    );
  }

  /// 초기화 버튼 위젯.
  RaisedButton _buildClearCounter() {
    return RaisedButton(
      onPressed: () {
        this._counter = 0;
        this.setCounterText();
      },
      child: Text("CLEAR"),
    );
  }
}
