import 'package:flutter/material.dart';
import 'package:mounae/providers/route_page_provider.dart';
import 'package:mounae/routes/app_route_delegate.dart';
import 'package:mounae/routes/app_route_information_parser.dart';
import 'package:provider/provider.dart';

class MounaeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<RoutePageProvider>(
      create: (BuildContext context) {
        return RoutePageProvider();
      },
      builder: (BuildContext context, Widget child) {
        return MaterialApp.router(
          routerDelegate: AppRouteDelegate(),
          routeInformationParser: AppRouteInformationParser(),
        );
      },
    );
  }
}
