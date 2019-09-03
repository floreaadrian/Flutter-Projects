import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'form_page.dart';
import 'state_container.dart';

void main() {
  runApp(new StateContainer(child: new UserApp()));
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
  User user;

  Widget get _userInfo {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text("${user.firstName} ${user.lastName}",
              style: new TextStyle(fontSize: 24.0)),
          new Text(user.email, style: new TextStyle(fontSize: 24.0)),
        ],
      ),
    );
  }

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
    final container = StateContainer.of(context);
    user = container.user;
    var body = user != null ? _userInfo : _logInPrompt;
    return new Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Smecherie 🔥'),
      ),
      body: body,
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _updateUser(context),
        child: new Icon(Icons.edit),
      ),
    );
  }
}
