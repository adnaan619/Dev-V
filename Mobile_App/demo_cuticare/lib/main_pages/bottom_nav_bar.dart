import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';

void main() => runApp(MaterialApp(
    home: BottomNavBar()
));

class BottomNavBar extends StatefulWidget {
const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
@override
Widget build(BuildContext context) {
  return CupertinoTabScaffold(
    tabBar: CupertinoTabBar(

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          activeIcon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(

          icon: Icon(Icons.group_rounded),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_sharp),
        ),
      ],
    ),
    tabBuilder: (context, index) {
      switch (index) {
        case 0:
          return CupertinoTabView(builder: (context) {
            return CupertinoPageScaffold(
              child: Home(),
            );
          });
        case 1:
          return CupertinoTabView(builder: (context) {
            return CupertinoPageScaffold(
              child: Home(),
            );
          });
        case 2:
          return CupertinoTabView(builder: (context) {
            return CupertinoPageScaffold(
              child: Text("1"),
            );
          });
        case 3:
          return CupertinoTabView(builder: (context) {
            return CupertinoPageScaffold(
              child: Home(),
            );
          });
        case 4:
          return CupertinoTabView(builder: (context) {
            return CupertinoPageScaffold(
              child: Home(),
            );
          });
        default:
          return CupertinoTabView(builder: (context) {
          return CupertinoPageScaffold(
            child: Home(),
          );
        });
      }
    },
  );
}
}
