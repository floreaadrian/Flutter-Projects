import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'state_container.dart';

class UpdateUserScreen extends StatelessWidget {
  const UpdateUserScreen({Key key}) : super(key: key);

  static final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  static final GlobalKey<FormFieldState<String>> firstNameKey =
      new GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> lastNameKey =
      new GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> emailKey =
      new GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);

    return new Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Editeaza sefu 🤓'),
      ),
      body: new Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidate: false,
          child: ListView(
            children: <Widget>[
              new TextFormField(
                key: firstNameKey,
                style: Theme.of(context).textTheme.headline,
                decoration: new InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              new TextFormField(
                key: lastNameKey,
                style: Theme.of(context).textTheme.headline,
                decoration: new InputDecoration(
                  hintText: 'Second Name',
                ),
              ),
              new TextFormField(
                key: emailKey,
                style: Theme.of(context).textTheme.headline,
                decoration: new InputDecoration(
                  hintText: 'Email',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: () {
            final form = formKey.currentState;
            if (form.validate()) {
              var firstName = firstNameKey.currentState.value;
              var lastName = lastNameKey.currentState.value;
              var email = emailKey.currentState.value;
              if (firstName == '') {
                firstName = null;
              }
              if (lastName == '') {
                lastName = null;
              }
              if (email == '') {
                email = null;
              }
              container.updateUserInfo(
                  firstName: firstName, lastName: lastName, email: email);
              Navigator.pop(context);
            }
          }),
    );
  }
}
