import 'package:flutter/material.dart';

/// Currently using MaterialPageRoute
///
/// Will automatically use CupertinoPageRoute for iOS
PageRoute pageTransitionDefault(Widget screenToDisplay,
    {bool isFullscreenDialog = false}) {
  return MaterialPageRoute(
    builder: (context) => screenToDisplay,
    fullscreenDialog: isFullscreenDialog,
  );
}

PageRoute pageTransitionSlideFromBottom(Widget screenToDisplay) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screenToDisplay,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
