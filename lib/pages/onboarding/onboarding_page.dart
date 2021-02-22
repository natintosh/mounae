import 'package:flutter/material.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class OnBoardingPage extends StatefulWidget {
  static const String path = '/onboarding';

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return _OnBoardingScreenView(this);
  }
}

class _OnBoardingScreenView
    extends WidgetView<OnBoardingPage, _OnBoardingPageState> {
  _OnBoardingScreenView(_OnBoardingPageState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Container(
        decoration: BoxDecoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Mounae'),
              ElevatedButton(onPressed: () {}, child: Text('Button'))
            ],
          ),
        ),
      ),
    );
  }
}
