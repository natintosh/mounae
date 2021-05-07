import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mounae/providers/auth_provider.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:provider/provider.dart';
import 'package:sized_context/sized_context.dart';

class AccountBankFeatureScreen extends StatefulWidget {
  static const String path = '/index/account/bank-feature';

  @override
  _AccountBankFeatureScreenState createState() =>
      _AccountBankFeatureScreenState();
}

class _AccountBankFeatureScreenState extends State<AccountBankFeatureScreen> {
  @override
  Widget build(BuildContext context) {
    return _AccountBankFeatureView(this);
  }

  bool isLoading = false;

  void onAddBankAccountButtonPressed() {
    initOkraWidget();
  }

  void initOkraWidget() async {
    setState(() {
      isLoading = true;
    });
    AppRouterDelegate.of(context).push(AccountConfiguration());

    setState(() {
      isLoading = false;
    });
  }

  void onSkipButtonPressed() {}
}

class _AccountBankFeatureView extends WidgetView<AccountBankFeatureScreen,
    _AccountBankFeatureScreenState> {
  _AccountBankFeatureView(_AccountBankFeatureScreenState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MounaeColors.primaryColor,
      appBar: AppBar(
        title: Text(
          'Accounts',
          style: Theme.of(context)
              .appBarTheme
              .textTheme!
              .headline6!
              .copyWith(color: MounaeColors.primaryTextColor),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40.sp,
            color: MounaeColors.primaryTextColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: MounaeColors.primaryColor,
        automaticallyImplyLeading: false,
      ),
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
                  SizedBox(height: 84.sp),
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
                        style: Theme.of(context).textButtonTheme.style!.copyWith(
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
