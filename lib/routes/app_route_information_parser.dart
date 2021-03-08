import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mounae/routes/page_configuration.dart';

class AppRouteInformationParser
    extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) {
    switch (routeInformation.location) {
      case SplashRouteConfiguration.path:
        return SynchronousFuture(SplashRouteConfiguration());
      case OnboardingRouteConfiguration.path:
        return SynchronousFuture(OnboardingRouteConfiguration());
      case SignInRouteConfiguration.path:
        return SynchronousFuture(SignInRouteConfiguration());
      case SignUpRouteConfiguration.path:
        return SynchronousFuture(SignUpRouteConfiguration());
      case OtpSendRouteConfiguration.path:
        return SynchronousFuture(OtpSendRouteConfiguration());
      case OtpVerificationConfiguration.path:
        return SynchronousFuture(OtpVerificationConfiguration());
      case SetUsernameConfiguration.path:
        return SynchronousFuture(SetUsernameConfiguration());
      case SetPassCodeConfiguration.path:
        return SynchronousFuture(SetPassCodeConfiguration());
      case SetPassCodeConfirmationConfiguration.path:
        return SynchronousFuture(SetPassCodeConfirmationConfiguration());
      case BiometricsOptionConfiguration.path:
        return SynchronousFuture(BiometricsOptionConfiguration());
      case PassCodeConfiguration.path:
        return SynchronousFuture(PassCodeConfiguration());
      case IndexConfiguration.path:
        return SynchronousFuture(IndexConfiguration());
      default:
        return SynchronousFuture(SplashRouteConfiguration());
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    return RouteInformation(
      location: configuration.name,
    );
  }
}
