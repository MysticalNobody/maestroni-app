import 'package:flutter/material.dart';

class CustomRouteTransition {
  static Widget crossFade(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        color: Theme.of(context).canvasColor,
        child: FadeTransition(
          opacity: ReverseAnimation(secondaryAnimation),
          child: child,
        ),
      ),
    );
  }
}
