import 'package:flutter/material.dart';
import 'package:mounae/routes/routes.dart';

class SplashPage extends Page {
  static const String KEY = '@Splash';

  final String name;
  final Object arguments;

  const SplashPage({@required LocalKey key, this.name, this.arguments})
      : assert(key != null),
        super(key: key, name: name, arguments: arguments);

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return SplashScreen();
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('SPLASH SCREEN'),
              ElevatedButton(
                onPressed: () {
                  AppRouteDelegate delegate = Router.of(context).routerDelegate;

                  delegate.setNewRoutePath(AppRoutePathOnBoarding());
                },
                child: Text('CONTINUE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
