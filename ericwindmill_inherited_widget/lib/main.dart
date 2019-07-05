import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'form_page.dart';

void main() {
  runApp(new UserApp());
}

class UserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget get _logInPrompt {
    return new Center(
      child: new Container(
        child: Text('Please add user information',
            style: const TextStyle(fontSize: 18.0)),
      ),
    );
  }

  void _updateUser(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) {
            return new UpdateUserScreen();
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Smecherie 🔥'),
      ),
      body: _logInPrompt,
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _updateUser(context),
        child: new Icon(Icons.edit),
      ),
    );
  }
}
