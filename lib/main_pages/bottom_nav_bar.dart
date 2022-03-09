import 'package:demo_cuticare/main_pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../resources.dart';
import 'home.dart';

// void main() => runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: BottomNavBar()
// ));


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

          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          activeIcon: Icon(Icons.location_on),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_outlined),
          activeIcon: Icon(Icons.assignment),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          activeIcon: Icon(Icons.person),
        ),
      ],
      activeColor: c

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
              child: Text("1"),
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
              child: Profile(),
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
