import 'package:demo_cuticare/resources.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:demo_cuticare/sign_in.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

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

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        // color: Colors.yellow,
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage('assets/applogo.png'),
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.yellow,
                            blurRadius: 6,
                            offset: Offset(4, 8),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(20.0),
                      width: 270.0,
                      child: TextLiquidFill(
                        text: "\nCutiCare.",
                        waveColor: Colors.white,
                        boxBackgroundColor: c,
                        textStyle: TextStyle(
                          //color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                        boxHeight: 200.0,
                      ),
                    ),

                  ],

                ),
              ),
              Expanded(flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: const <Widget> [

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