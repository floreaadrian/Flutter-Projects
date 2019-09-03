import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      builder: (context) => Counter(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Counter'),
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('tap to increase'),
            Consumer<Counter>(
              builder: (context, counter, child) => Text('${counter.value}'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<Counter>(context, listen: false).increase(),
        child: Icon(Icons.plus_one),
      ),
    ));
  }
}

class Counter extends ChangeNotifier {
  int value = 0;

  void increase() {
    value++;
    notifyListeners();
  }
}
