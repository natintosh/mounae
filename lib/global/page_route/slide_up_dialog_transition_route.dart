import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SlideUpDialogTransitionRoute extends PageRouteBuilder {
  SlideUpDialogTransitionRoute({RouteSettings? settings, required Widget child})
      : super(
          settings: settings,
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
