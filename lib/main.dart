import 'package:flutter/material.dart';
import './screen/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      title: 'Flutter REST API',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      },
    );
  }
}
