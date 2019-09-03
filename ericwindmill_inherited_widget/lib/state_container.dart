import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User {
  String firstName;
  String lastName;
  String email;

  User(this.firstName, this.lastName, this.email);
}

class _InheritedStateContainer extends InheritedWidget {
  _InheritedStateContainer({Key key, @required this.data, @required this.child})
      : super(key: key, child: child);

  final _StateContainerState data;

  final Widget child;

  static _InheritedStateContainer of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
        as _InheritedStateContainer);
  }

  @override
  bool updateShouldNotify(_InheritedStateContainer oldWidget) => true;
}

class StateContainer extends StatefulWidget {
  StateContainer({Key key, @required this.child, this.user}) : super(key: key);

  final Widget child;
  final User user;

  static _StateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
            as _InheritedStateContainer)
        .data;
  }

  _StateContainerState createState() => _StateContainerState();
}

class _StateContainerState extends State<StateContainer> {
  User user;

  void updateUserInfo({firstName, lastName, email}) {
    if (user == null) {
      user = new User(firstName, lastName, email);
      setState(() {
        user = user;
      });
    } else {
      setState(() {
        user.firstName = firstName ?? user.firstName;
        user.lastName = lastName ?? user.lastName;
        user.email = email ?? user.email;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}
