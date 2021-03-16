import 'package:flutter/material.dart';
import 'package:food/screens/signin.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:food/models/mealscontroller.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MealsController(),
      child: MaterialApp(
        home: SignIn(),
        debugShowCheckedModeBanner: false,
        // routes: {
        //   'results' : (context) => Results('className'),
        // }
      ),
    );
  }
}