import 'dart:developer';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mounae/global/views/connect_account/connect_account_view.dart';
import 'package:mounae/global/views/exit_app/exit_app_view.dart';
import 'package:mounae/providers/auth_provider.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:provider/provider.dart';
import 'package:sized_context/sized_context.dart';

class AccountOnBoardingScreen extends StatefulWidget {
  static const String path = '/connect-bank-onboarding';

  @override
  _AccountOnBoardingScreenState createState() =>
      _AccountOnBoardingScreenState();
}

class _AccountOnBoardingScreenState extends State<AccountOnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: _AccountOnBoardingView(this),
    );
  }

  bool isLoading = false;

  Future<bool> onWillPop() async {
    GlobalExitAppView.show(context);
    return false;
  }

  void onAddBankAccountButtonPressed() {
    initConnectAccountView();
  }

  void initConnectAccountView() async {
    setState(() {
      isLoading = true;
    });

    GlobalConnectAccountView.show(context, onError: onError);
  }

  void onSkipButtonPressed() {
    Beamer.of(context).beamToNamed('/index');
    Beamer.of(context).clearBeamLocationHistory();
  }

  void onError(AccountConnectionHandler? handler) {
    if (handler != null) {
      if (handler.isSuccessful) {
        log(handler.data);
        Beamer.of(context).beamToNamed(
          '/index/accounts',
          stacked: false,
          popToNamed: '/index',
        );
      } else if (handler.hasError) {}
    }
    setState(() {
      isLoading = false;
    });
  }
}

class _AccountOnBoardingView
    extends WidgetView<AccountOnBoardingScreen, _AccountOnBoardingScreenState> {
  _AccountOnBoardingView(_AccountOnBoardingScreenState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MounaeColors.primaryColor,
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Opacity(
                opacity: 0.6,
                child: SvgPicture.asset(
                  'assets/svg/bank.svg',
                  height: 117.sp,
                  fit: BoxFit.fitHeight,
                  alignment: Alignment(-0.17, 0),
                  allowDrawingOutsideViewBox: true,
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Column(
                children: [
                  SizedBox(height: 52.sp),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed:
                          state.isLoading ? null : state.onSkipButtonPressed,
                      child: Text('Skip>>'),
                      style: Theme.of(context).textButtonTheme.style!.copyWith(
                            overlayColor: MaterialStateProperty.all<Color>(
                              Color(0xFFFFFFFF).withOpacity(0.2),
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFFFFFFFF),
                            ),
                          ),
                    ),
                  ),
                  SizedBox(height: 72.sp),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hello ${context.read<AuthProvider>().displayName ?? ''},',
                        style: Theme.of(context).accentTextTheme.headline6,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 14.sp),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: 250.sp,
                      child: Text(
                        'Connect Your Bank Account(s)',
                        style: Theme.of(context).accentTextTheme.headline5,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.sp),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'You don’t need to manually input all your expenses or Income. Access your bank transaction history and bank balance by connecting directly with your bank',
                        style: Theme.of(context).accentTextTheme.bodyText1,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.sp),
                  Container(
                    width: context.widthPx,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.sp,
                      vertical: 8.sp,
                    ),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: Text.rich(
                      TextSpan(text: 'Note! ', children: [
                        TextSpan(
                          text: 'This does not give us is access to your money',
                          style: Theme.of(context).accentTextTheme.bodyText1,
                        ),
                      ]),
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1!
                          .copyWith(
                              color: MounaeColors.debitReductionAlertColor),
                    ),
                  ),
                  SizedBox(height: 120.sp),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: context.widthPx,
                      child: TextButton(
                        onPressed: state.isLoading
                            ? null
                            : state.onAddBankAccountButtonPressed,
                        child: state.isLoading
                            ? SizedBox(
                                height: 24.sp,
                                width: 24.sp,
                                child: LoadingIndicator(
                                  indicatorType: Indicator.ballSpinFadeLoader,
                                  color: MounaeColors.primaryColor,
                                ),
                              )
                            : Text(
                                'Add Bank Account(s)',
                              ),
                        style: Theme.of(context)
                            .textButtonTheme
                            .style!
                            .copyWith(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                MounaeColors.backgroundColor,
                              ),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
