import 'package:flutter/material.dart';

class RoutePageProvider extends ChangeNotifier {
  String _pageRoute;

  String get pageRoute => _pageRoute;

  set pageRoute(String value) {
    _pageRoute = value;
    notifyListeners();
  }
}
