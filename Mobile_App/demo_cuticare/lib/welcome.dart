import 'package:flutter/material.dart';
import 'dart:async';
import 'package:demo_cuticare/sign_in.dart';

void main() => runApp(MaterialApp(
  theme:
    ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
  ));

Color c = const Color(0xFFFF2943);

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (BuildContext context) => SignIn())));
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget> [
          Container(
            decoration: BoxDecoration(color: c),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 70.0,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.greenAccent,
                          size: 70.0,
                        ),
                      ),
                      Text(
                        "\nCutiCare.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            fontFamily: 'Roboto-Regular',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text("Your Personal \nSkin Care App.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,

                        ),
                    ),
                    Text("\n+DevV Projects+",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

              ),
            ],
          ),
        ],
      ),
    );
  }
}