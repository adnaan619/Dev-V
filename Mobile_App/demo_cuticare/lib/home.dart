import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
  int index = 2;
  final screens = [
    Center(child: Text('Community', style: TextStyle(fontSize:72))),
    Center(child: Text('Result', style: TextStyle(fontSize:72))),
    Center(child: Text('Home', style: TextStyle(fontSize:72))),
    Center(child: Text('Results', style: TextStyle(fontSize:72))),
    Center(child: Text('Profile', style: TextStyle(fontSize:72)))
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size:30),
      Icon(Icons.group_rounded, size:30),
      Icon(Icons.location_on, size:30),
      Icon(Icons.assignment, size:30),
      Icon(Icons.person_sharp, size:30),
    ];
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        elevation: 0
      ),
      body: Center(
        child: Text(
          '$index',
          style: TextStyle(
            color: Colors.white,
            fontSize:120,
            fontWeight:  FontWeight.bold
          )
        )
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        height: 60,
        index: index,
        items: items,
        onTap: (index) => setState(() => this.index = index),
      )
    );
  }
}