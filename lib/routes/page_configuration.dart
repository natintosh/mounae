import 'package:flutter/material.dart';
import 'package:mounae/pages/authentication/signin/signin_page.dart';
import 'package:mounae/pages/authentication/signup/signup_page.dart';
import 'package:mounae/pages/onboarding/onboarding_page.dart';
import 'package:mounae/pages/splash/splash_page.dart';

abstract class PageConfiguration {
  final Widget child;

  PageConfiguration(this.child);

  String get path;
}

class SplashRouteConfiguration extends PageConfiguration {
  SplashRouteConfiguration(Widget child) : super(child);

  @override
  String get path => SplashPage.path;
}

class OnboardingRouteConfiguration extends PageConfiguration {
  OnboardingRouteConfiguration(Widget child) : super(child);

  @override
  String get path => OnBoardingPage.path;
}

class SignUpRouteConfiguration extends PageConfiguration {
  SignUpRouteConfiguration(Widget child) : super(child);

  @override
  String get path => SignUpPage.path;
}

class SignInRouteConfiguration extends PageConfiguration {
  SignInRouteConfiguration(Widget child) : super(child);

  @override
  String get path => SignInPage.path;
}
