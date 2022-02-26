import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return materialApp(
      title: 'Parking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Search(),
    );
  }
}