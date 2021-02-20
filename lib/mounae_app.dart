import 'package:flutter/material.dart';
import 'package:mounae/routes/routes.dart';

class MounaeApp extends StatefulWidget {
  @override
  _MounaeAppState createState() => _MounaeAppState();
}

class _MounaeAppState extends State<MounaeApp> {
  static final GlobalKey<ScaffoldState> globalScaffoldKey =
      GlobalKey<ScaffoldState>();

  AppRouteDelegate _routeDelegate = AppRouteDelegate();
  AppRouteInformationParser _informationParser = AppRouteInformationParser();
  BackButtonDispatcher _buttonDispatcher = RootBackButtonDispatcher();

  @override
  Widget build(BuildContext context) {
    _buttonDispatcher.takePriority();
    return MaterialApp.router(
      title: 'Mounae',
      routerDelegate: _routeDelegate,
      routeInformationParser: _informationParser,
      backButtonDispatcher: _buttonDispatcher,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Scaffold(
          key: globalScaffoldKey,
          body: child,
        );
      },
    );
  }
}
