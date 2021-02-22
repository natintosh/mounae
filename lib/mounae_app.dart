import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mounae/pages/onboarding/onboarding_page.dart';
import 'package:mounae/pages/splash/splash_page.dart';
import 'package:mounae/providers/preference_provider.dart';
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
        return MaterialApp(
          title: 'Mounae',
          debugShowCheckedModeBanner: false,
          theme: MounaeThemeData.lightTheme,
          initialRoute: '/',
          onGenerateRoute: onGenerateRoute,
          builder: (context, child) {
            return Scaffold(
              key: globalScaffoldKey,
              body: child,
            );
          },
        );
      },
    );
  }

  Route<Object> onGenerateRoute(RouteSettings settings) {
    bool fullScreenDialog = false;
    Widget builder = Container();

    switch (settings.name) {
      case SplashPage.path:
        builder = SplashPage();
        break;
      case OnBoardingPage.path:
        builder = OnBoardingPage();
        break;
      default:
        throw new Exception("MounaeApp: Invalid Page Route ${settings.name}");
        break;
    }

    if (Platform.isIOS) {
      return CupertinoPageRoute(
        settings: settings,
        fullscreenDialog: fullScreenDialog,
        builder: (context) {
          return builder;
        },
      );
    }

    return MaterialPageRoute(
      settings: settings,
      fullscreenDialog: fullScreenDialog,
      builder: (context) {
        return builder;
      },
    );
  }
}
