import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return _OnBoardingScreenView(this);
  }

  @override
  void initState() {
    controller = PageController()..addListener(onScreenChangeListener);
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (this.mounted) {
      super.setState(fn);
    }
  }

  PageController? controller;

  int index = 0;

  void onScreenChangeListener() {
    setState(() {
      index = controller!.page!.truncate();
    });
  }

  void onSignUpButtonPressed() {
    Beamer.of(context).beamToNamed('/authentication/signup');
  }

  void onSignInButtonPressed() {
    Beamer.of(context).beamToNamed('/authentication/signin');
  }
}

class _OnBoardingScreenView
    extends WidgetView<OnBoardingScreen, _OnBoardingScreenState> {
  _OnBoardingScreenView(_OnBoardingScreenState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: PageView(
                  controller: state.controller,
                  children: [
                    OnBoardingDetails(
                      asset: 'assets/svg/onboarding/finance.svg',
                      title: 'Everything About Your Finance',
                      content:
                          'Monitor Everything about your Finances; All your Bank Account, Insurance, Investment, Loans, Asset and Savings in one place.',
                    ),
                    OnBoardingDetails(
                        asset: 'assets/svg/onboarding/goal.svg',
                        title: 'Achieve Financial Target/Goal',
                        content:
                            'Set financial target and meet them with features like Auto Save, Dollar and Naira Investment, Automated Bill Payment/ Money Transfer'),
                    OnBoardingDetails(
                        asset: 'assets/svg/onboarding/freedom.svg',
                        title: 'Financial Freedom',
                        content:
                            'Get personalised financial analysis, report and advice that put your financial freedom first'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.sp,
                horizontal: 24.sp,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: state.onSignInButtonPressed,
                    child: Text('Sign In'),
                  ),
                  DotIndicator(
                    index: state.index,
                    count: 3,
                  ),
                  TextButton(
                    onPressed: state.onSignUpButtonPressed,
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingDetails extends StatelessWidget {
  final String asset;
  final String title;
  final String content;

  const OnBoardingDetails(
      {Key? key,
      required this.asset,
      required this.title,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.sp,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 92.sp),
              child: SizedBox(
                height: 330.sp,
                child: SvgPicture.asset(
                  asset,
                  allowDrawingOutsideViewBox: true,
                  clipBehavior: Clip.antiAlias,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.sp,
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SizedBox(
              height: 16.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.sp,
              ),
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  final int? index;
  final int? count;

  const DotIndicator({Key? key, this.index, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: builder(context, index, count!)),
    );
  }

  List<Widget> builder(BuildContext context, int? index, int count) {
    List<Widget> list = [];

    for (int item in List<int>.generate(count, (index) => index)) {
      list.add(Container(
        decoration: ShapeDecoration(
          color: index == item
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          shape: CircleBorder(),
        ),
        padding: EdgeInsets.all(4.0.sp),
        margin: EdgeInsets.all(6.0.sp),
      ));
    }
    return list;
  }
}
