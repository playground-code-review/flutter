import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

import 'counter_provider.dart';

class MyHomePage extends HookWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read(counterProvider).configureCounter(
          step: 2,
          lowerLimit: 0,
          upperLimit: 10,
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            CounterText(),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () => context.read(counterProvider).reset(),
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
              onPressed: () => context.read(counterProvider).increment(),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(
              height: 10.0,
            ),
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () => context.read(counterProvider).decrement(),
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterText extends HookWidget {
  CounterText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = useProvider(counterProvider.state);
    return Text(
      "${counter.value}",
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
