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
            const SizedBox(height: 70),
            const Text("Cuti",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 70
                )),
            Row(
                children: <Widget>[
                  const Text("Care",
                      style:TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 70)),
                  Text(".",
                      style:TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 80,
                          color: c
                      ))
                ]
            )
          ],
        )
    );
  }
}