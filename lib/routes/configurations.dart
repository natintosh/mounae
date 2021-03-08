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

class OtpSendRouteConfiguration extends PageConfiguration {
  static const String path = OtpSendPage.path;

  @override
  Widget get child => OtpSendPage();

  @override
  String get name => path;
}

class OtpVerificationConfiguration extends PageConfiguration {
  static const String path = OtpVerificationPage.path;

  @override
  Widget get child => OtpVerificationPage();

  @override
  String get name => path;
}

class SetUsernameConfiguration extends PageConfiguration {
  static const String path = SetUsernamePage.path;

  @override
  Widget get child => SetUsernamePage();

  @override
  String get name => path;
}

class SetPassCodeConfiguration extends PageConfiguration {
  static const String path = SetPassCodePage.path;

  @override
  Widget get child => SetPassCodePage();

  @override
  String get name => path;
}

class SetPassCodeConfirmationConfiguration extends PageConfiguration {
  static const String path = SetPassCodeConfirmationPage.path;

  @override
  Widget get child => SetPassCodeConfirmationPage();

  @override
  String get name => path;
}

class BiometricsOptionConfiguration extends PageConfiguration {
  static const String path = BiometricsOptionPage.path;

  @override
  Widget get child => BiometricsOptionPage();

  @override
  String get name => path;
}

class PassCodeConfiguration extends PageConfiguration {
  static const String path = PassCodePage.path;

  @override
  Widget get child => PassCodePage();

  @override
  String get name => path;
}

class IndexConfiguration extends PageConfiguration {
  static const String path = IndexScreen.path;

  @override
  Widget get child => IndexScreen();

  @override
  String get name => path;
}
