import 'package:flutter/material.dart';

class MyLoginScreen extends StatelessWidget {
  const MyLoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Welcome', style: Theme.of(context).textTheme.display4),
              _LoginTextField(hintText: 'Login'),
              SizedBox(height: 12),
              _LoginTextField(hintText: 'Password', obscureText: true),
              SizedBox(height: 24),
              FlatButton(
                color: Colors.yellow,
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/catalog'),
                child: Text('Enter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginTextField extends StatelessWidget {
  const _LoginTextField({Key key, @required this.hintText, this.obscureText:false})
      : super(key: key);

  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: hintText, fillColor: Colors.blue),
      obscureText: obscureText,
    );
  }
}
