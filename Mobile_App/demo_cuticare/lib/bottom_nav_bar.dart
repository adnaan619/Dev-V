import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MaterialApp(
    home: BottomNavBar()
));

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 2;
  final screens = [
    Home(),

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
    return SafeArea(
      top: false,
      child: ClipRect(
        child: Scaffold(
            extendBody: true,
            backgroundColor: Colors.blue[200],
            appBar: AppBar(
                elevation: 0
            ),
            body: screens[index],
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              height: 60,
              index: index,
              items: items,
              onTap: (index) => setState(() => this.index = index),
            )
        ),
      ),
    );
  }
}