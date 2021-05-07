import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _phoneNumber;
  String? _displayName;

  set phoneNumber(String? value) {
    _phoneNumber = value;
    notifyListeners();
  }

  String? get phoneNumber => _phoneNumber;

  set displayName(String? value) {
    _displayName = value;
    notifyListeners();
  }

  String? get displayName => _displayName;
}
