part of 'routes.dart';

class AppRouteDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  AppRoutePath _configuration = AppRoutePathSplashScreen();

  @override
  AppRoutePath get currentConfiguration => _configuration;

  set currentConfiguration(AppRoutePath value) {
    _configuration = value;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        SplashPage(
          key: ValueKey(SplashPage.KEY),
          name: AppRoutePathSplashScreen.path,
        ),
        if (currentConfiguration is AppRoutePathOnBoarding)
          OnBoardingPage(
            key: ValueKey(OnBoardingPage.KEY),
            name: AppRoutePathOnBoarding.path,
          ),
      ],
      onPopPage: (route, result) {
        bool success = route.didPop(result);
        if (success) {
          currentConfiguration = AppRoutePathSplashScreen();
        }
        return success;
      },
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    currentConfiguration = configuration;
  }
}
