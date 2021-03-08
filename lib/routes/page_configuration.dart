import 'package:flutter/material.dart';

part 'configurations/auth_configurations.dart';
part 'configurations/index_configurations.dart';

abstract class PageConfiguration {
  String get name;

  Widget get child;
}
