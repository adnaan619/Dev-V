import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';

void main() => runApp(MaterialApp(
    home: BottomNavBar()
));

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  final screens = [
    Home(),
    Profile(),
    Profile(),
    Profile(),
    Home()
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
              backgroundColor: Colors.redAccent,
              extendBody: true,
              appBar: AppBar(
                  elevation: 0
              ),
              body: screens[index],
              bottomNavigationBar: CurvedNavigationBar(
                key: navigationKey,
                backgroundColor: Colors.transparent,
                height: 60,
                animationCurve: Curves.easeInOut,
                animationDuration:Duration(milliseconds: 300),
                index: index,
                items: items,
                onTap: (index) => setState(() => this.index = index),
              )
          ),
        ),
    );
  }
}