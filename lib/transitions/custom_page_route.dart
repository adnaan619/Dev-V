import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {
  final child;

  CustomRoute({this.child})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      if (animation.status == AnimationStatus.reverse) {
        return Opacity(opacity: 0, child: child);
      } else {
        return child;
      }
    },
    transitionDuration: Duration(milliseconds: 1000),
    reverseTransitionDuration: Duration(milliseconds: 1000),
  );
}