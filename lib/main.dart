import 'package:flutter/material.dart';


void main() {
  return runApp(FirstSceen());
}


class FirstSceen extends StatelessWidget{

final String x = 'Welcome to our screen';

@override
  Widget build(BuildContext context) {
    return Text(x);
  }
}




class SecondScreen extends StatefulWidget{

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>{

String x = 'Welcome to state';

  @override
  Widget build(BuildContext context){
    return Text(x);
  }
}