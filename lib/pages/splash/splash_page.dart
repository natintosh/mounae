import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:sized_context/sized_context.dart';

class SplashPage extends StatefulWidget {
  static const String path = '/';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return _SplashScreenView(this);
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    )..addListener(() {
        if (controller.isCompleted) {
          AppRouterDelegate delegate = AppRouterDelegate.of(context);
          delegate.push(
            OnboardingRouteConfiguration(),
          );
        }
      });
    circleVisibilityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.15, curve: Curves.easeIn),
      ),
    );
    northVisibilityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.15, 0.30, curve: Curves.easeIn),
      ),
    );
    southVisibilityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.30, 0.45, curve: Curves.easeIn),
      ),
    );
    iconTranslationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.45, 0.70, curve: Curves.easeIn),
      ),
    );
    textVisibilityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.7, 1.0, curve: Curves.easeIn),
      ),
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (this.mounted) {
      super.setState(fn);
    }
  }

  AnimationController controller;
  Animation<double> textVisibilityAnimation;
  Animation<double> circleVisibilityAnimation;
  Animation<double> northVisibilityAnimation;
  Animation<double> southVisibilityAnimation;
  Animation<double> iconTranslationAnimation;
}

class _SplashScreenView extends WidgetView<SplashPage, _SplashPageState> {
  _SplashScreenView(_SplashPageState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: AnimatedBuilder(
          animation: state.controller,
          builder: (context, child) {
            return Center(
              child: SizedBox(
                width: context.widthPx,
                height: context.heightPx,
                child: Stack(
                  children: [
                    Builder(builder: (context) {
                      double x = -state.iconTranslationAnimation.value *
                          (context.widthPx / 3.2) /
                          (context.widthPx / 2);
                      return Align(
                        alignment: Alignment(x, 0),
                        child: SizedBox(
                          height: 65.sp,
                          width: 52.sp,
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: state.northVisibilityAnimation.value,
                                child: Align(
                                  alignment: Alignment(0.0,
                                      -state.northVisibilityAnimation.value),
                                  child: SvgPicture.asset(
                                      'assets/svg/logo/chevron_north.svg'),
                                ),
                              ),
                              Opacity(
                                opacity: state.circleVisibilityAnimation.value,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                      'assets/svg/logo/circle.svg'),
                                ),
                              ),
                              Opacity(
                                opacity: state.southVisibilityAnimation.value,
                                child: Align(
                                  alignment: Alignment(0.0,
                                      state.southVisibilityAnimation.value),
                                  child: Container(
                                    child: SvgPicture.asset(
                                        'assets/svg/logo/chevron_south.svg'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    Align(
                      alignment: Alignment.center,
                      child: Opacity(
                        opacity: state.textVisibilityAnimation.value,
                        child: SizedBox(
                          child: Center(
                            child: Text(
                              'Mounae',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headline4
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 3.5.sp,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
