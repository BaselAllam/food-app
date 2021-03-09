import 'package:flutter/material.dart';
import 'package:food/screens/signin.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn(),
      debugShowCheckedModeBanner: false,
      // routes: {
      //   'results' : (context) => Results('className'),
      // }
    );
  }
}