import 'package:flutter/material.dart';
import 'package:mounae/pages/authentication/signin/signin_page.dart';
import 'package:mounae/pages/authentication/signup/signup_page.dart';
import 'package:mounae/pages/onboarding/onboarding_page.dart';
import 'package:mounae/pages/splash/splash_page.dart';

part 'configurations.dart';

abstract class PageConfiguration {
  String get name;

  Widget get child;
}
