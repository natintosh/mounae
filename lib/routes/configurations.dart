part of 'page_configuration.dart';

class SplashRouteConfiguration extends PageConfiguration {
  static const String path = SplashPage.path;

  @override
  String get name => path;

  @override
  Widget get child => SplashPage();
}

class OnboardingRouteConfiguration extends PageConfiguration {
  static const String path = OnBoardingPage.path;

  @override
  String get name => path;

  @override
  Widget get child => OnBoardingPage();
}

class SignUpRouteConfiguration extends PageConfiguration {
  static const String path = SignUpPage.path;

  @override
  String get name => path;

  @override
  Widget get child => SignUpPage();
}

class SignInRouteConfiguration extends PageConfiguration {
  static const String path = SignInPage.path;

  @override
  String get name => path;

  @override
  Widget get child => SignInPage();
}
