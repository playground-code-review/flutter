import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground/my_home_page/bloc/my_home_page_bloc.dart';

class MyHomePage extends StatelessWidget {
//  final String title;
  int counter = 0;

  MyHomePage({Key key}) : super(key: key);

  MyHomePageBloc myHomePageBloc = MyHomePageBloc(MyHomePageState.empty());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body:BlocProvider<MyHomePageBloc>(
          create: (BuildContext context) => MyHomePageBloc(MyHomePageState.empty()),
          child: test()),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                _incrementCounter(myHomePageBloc.state.num);
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(
              height: 10.0,
            ),
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                _decrementCounter(myHomePageBloc.state.num);
              },
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
  Widget test(){
  return BlocBuilder<MyHomePageBloc,MyHomePageState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${myHomePageBloc.state.num}',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  _resetCounter(counter);
                },
                child: Text('RESET'),
              )
            ],
          ),
        );
      },
    );
  }

  void _incrementCounter(int num) {
    print(num);
    myHomePageBloc.add(PHomePageEvent(num: num));
  }

  void _decrementCounter(int num) {
    print(num);
    myHomePageBloc.add(MHomePageEvent(num: num));
  }

  void _resetCounter(int num) {
    myHomePageBloc.add(RHomePageEvent(num: num));
  }
}
