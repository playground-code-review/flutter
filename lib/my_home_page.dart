import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  static const int STEP = 2;

  void _incrementCounter() {
    setState(() {
      final int increased = _counter + STEP;
      _counter = getClamped(increased);
    });
  }

  void _decrementCounter() {
    setState(() {
      final int decreased = _counter - STEP;
      _counter = getClamped(decreased);
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  /// [counter]는 [LOWER_LIMIT]에서 [UPPER_LIMIT] 사이의 값만 허용한다.
  /// ex)
  ///   getClamped(-1) = 0, getClamped(0) = 0, getClamped(1) = 1, getClamped(3) = 3
  ///   getClamped(7) = 7, getClamped(10) = 10, getClamped(11) = 10
  int getClamped(int value) {
    const int LOWER_LIMIT = 0;
    const int UPPER_LIMIT = 10;
    return value.clamp(LOWER_LIMIT, UPPER_LIMIT);
  }

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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: _resetCounter,
              child: Text('RESET'),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(
              height: 10.0,
            ),
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
