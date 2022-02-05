import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home(
        // initialRoute: '/', //overriding the default route
        // routes:{
        //   '/': (context) => Loading(),
        //   '/home': (context) => Home(),
        //   '/location': (context) => ChooseLocation()
        // }
    )
));

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        child: Center(
          child: Scaffold(
            // Icon(icon:Icons.camera)
          ),
        ),
    );
  }
}