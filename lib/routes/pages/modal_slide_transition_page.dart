import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class ModalSlideTransitionPage extends BeamPage {
  final Widget child;

  ModalSlideTransitionPage({
    LocalKey? key,
    required this.child,
    bool keepQueryOnPop = false,
  }) : super(key: key, child: child, keepQueryOnPop: keepQueryOnPop);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      fullscreenDialog: true,
      opaque: false,
      barrierColor: Colors.black12.withOpacity(0.5),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return child;
      },
    );
  }
}
