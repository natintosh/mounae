import 'package:flutter/material.dart';
import 'package:mounae/routes/page_configuration.dart';

class AppRouteInformationParser
    extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);

    switch (uri.path) {
      case SplashRouteConfiguration.path:
        return SplashRouteConfiguration();
      case OnboardingRouteConfiguration.path:
        return OnboardingRouteConfiguration();
      case SignInRouteConfiguration.path:
        return SignInRouteConfiguration();
      case SignUpRouteConfiguration.path:
        return SignUpRouteConfiguration();
      default:
        return SplashRouteConfiguration();
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    return RouteInformation(
      location: configuration.name,
    );
  }
}
