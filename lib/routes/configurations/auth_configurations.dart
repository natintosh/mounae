part of '../page_configuration.dart';

class SplashRouteConfiguration extends PageConfiguration {
  static const String path = '';

  @override
  String get name => path;

  @override
  Widget get child => SplashScreen();
}

class OnBoardingRouteConfiguration extends PageConfiguration {
  static const String path = '';

  @override
  String get name => path;

  @override
  Widget get child => OnBoardingScreen();
}

class SignUpRouteConfiguration extends PageConfiguration {
  static const String path = '';

  @override
  String get name => path;

  @override
  Widget get child => SignUpScreen();
}

class SignInRouteConfiguration extends PageConfiguration {
  static const String path = '';

  @override
  String get name => path;

  @override
  Widget get child => SignInScreen();
}

class OtpSendRouteConfiguration extends PageConfiguration {
  static const String path = '';

  @override
  Widget get child => OtpSendScreen();

  @override
  String get name => path;
}

class OtpVerificationConfiguration extends PageConfiguration {
  static const String path = '';

  @override
  Widget get child => OtpVerificationScreen();

  @override
  String get name => path;
}

class SetUsernameConfiguration extends PageConfiguration {
  static const String path = SetUsernameScreen.path;

  @override
  Widget get child => SetUsernameScreen();

  @override
  String get name => path;
}

class SetPassCodeConfiguration extends PageConfiguration {
  static const String path = '';

  @override
  Widget get child => SetPassCodeScreen();

  @override
  String get name => path;
}

class SetPassCodeConfirmationConfiguration extends PageConfiguration {
  static const String path = '';

  @override
  Widget get child => SetPassCodeConfirmationScreen();

  @override
  String get name => path;
}

class BiometricsOptionConfiguration extends PageConfiguration {
  static const String path = '';

  @override
  Widget get child => BiometricsOptionScreen();

  @override
  String get name => path;
}

class PassCodeConfiguration extends PageConfiguration {
  static const String path = '';

  @override
  Widget get child => PassCodeScreen();

  @override
  String get name => path;
}

class ConnectBankOnboardingConfiguration extends PageConfiguration {
  static const String path = '';

  @override
  Widget get child => AccountOnBoardingScreen();

  @override
  String get name => path;
}
