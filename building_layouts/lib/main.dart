import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.blue[500]),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hatz'),
      ),
      body: Container(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.call,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: null,
                tooltip: 'call',
              ),
              Container(
                child: Text(
                  'CALL',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.router,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: null,
                tooltip: 'route',
              ),
              Container(
                child: Text(
                  'ROUTE',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: null,
                tooltip: 'share',
              ),
              Container(
                child: Text(
                  'SHARE',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
