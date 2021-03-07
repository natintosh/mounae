import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mounae/providers/auth_provider.dart';
import 'package:mounae/providers/preference_provider.dart';
import 'package:mounae/routes/app_route_information_parser.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/utils/themes/theme.dart';
import 'package:provider/provider.dart';

class MounaeApp extends StatefulWidget {
  @override
  _MounaeAppState createState() => _MounaeAppState();
}

class _MounaeAppState extends State<MounaeApp> {
  static final GlobalKey<ScaffoldState> globalScaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Theme.of(context).brightness,
        statusBarIconBrightness: MounaeThemeData.getIconBrightness(
          context,
          context.watch<PreferenceProvider>().themeOption,
        ),
      ),
    );

    return ScreenUtilInit(
      designSize: Size(360, 760),
      builder: () {
        return MaterialApp.router(
          title: 'Mounae',
          debugShowCheckedModeBanner: false,
          theme: MounaeThemeData.lightTheme,
          routerDelegate: AppRouterDelegate(),
          routeInformationParser: AppRouteInformationParser(),
          builder: (context, child) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (context) {
                  return AuthProvider();
                }),
              ],
              child: Scaffold(
                key: globalScaffoldKey,
                body: child,
              ),
            );
          },
        );
      },
    );
  }
}
