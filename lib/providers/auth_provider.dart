import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  String get phoneNumber => _phoneNumber;
}
