part of 'routes.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    switch (routeInformation.location) {
      case AppRoutePathSplashScreen.path:
        return AppRoutePathSplashScreen();
      case AppRoutePathOnBoarding.path:
        return AppRoutePathOnBoarding();
      default:
        return AppRoutePathSplashScreen();
    }
  }

  @override
  RouteInformation restoreRouteInformation(AppRoutePath configuration) {
    switch (configuration.runtimeType) {
      case AppRoutePathSplashScreen:
        return RouteInformation(location: AppRoutePathSplashScreen.path);
      case AppRoutePathOnBoarding:
        return RouteInformation(location: AppRoutePathOnBoarding.path);
      default:
        return RouteInformation(location: AppRoutePathSplashScreen.path);
    }
  }
}
