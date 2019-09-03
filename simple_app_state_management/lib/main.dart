import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_app_state_management/models/cart.dart';
import 'package:simple_app_state_management/screens/cart.dart';
import 'package:simple_app_state_management/screens/catalog.dart';
import 'package:simple_app_state_management/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smecherie',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          textTheme: TextTheme(
            display4: TextStyle(
              fontFamily: 'Ariel',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MyLoginScreen(),
          '/catalog': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}
