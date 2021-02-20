import 'package:flutter/material.dart';
import 'package:mounae/routes/routes.dart';

class OnBoardingPage extends Page {
  static const String KEY = '@OnBoarding';

  final String name;
  final Object arguments;

  const OnBoardingPage({@required LocalKey key, this.name, this.arguments})
      : assert(key != null),
        super(key: key, name: name, arguments: arguments);

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return OnBoardingScreen();
      },
    );
  }
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ON BOARDING SCREEN'),
              ElevatedButton(
                onPressed: () {
                  AppRouteDelegate delegate = Router.of(context).routerDelegate;
                },
                child: Text('BACK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
