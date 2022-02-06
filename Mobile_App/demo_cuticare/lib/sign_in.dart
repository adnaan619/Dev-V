import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: MyApp()
));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color c = const Color(0xFFFF2943);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white
      // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 70),
            Text("Cuti",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 70,
                    fontWeight: FontWeight.bold
                )),
            Row(
                children: <Widget>[
                  Text("Care",
                      style:TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 70)),
                  Text(".",
                      style:TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: c
                      ))
                ]
            )
          ],
        )
    );
  }
}