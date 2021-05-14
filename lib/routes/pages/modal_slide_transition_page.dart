import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:mounae/global/page_route/slide_up_dialog_transition_route.dart';

class ModalSlideTransitionPage extends BeamPage {
  final Widget child;

  ModalSlideTransitionPage({
    LocalKey? key,
    required this.child,
    bool keepQueryOnPop = false,
  }) : super(key: key, child: child, keepQueryOnPop: keepQueryOnPop);

  @override
  Route createRoute(BuildContext context) {
    return SlideUpDialogTransitionRoute(
      child: child,
      settings: this,
    );
  }
}
