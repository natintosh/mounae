import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mounae/pages/authentication/fingerprint_option/biometrics_option_page.dart';
import 'package:mounae/pages/authentication/otp_send/otp_send_page.dart';
import 'package:mounae/pages/authentication/otp_verification/otp_verification_page.dart';
import 'package:mounae/pages/authentication/passcode/passcode_page.dart';
import 'package:mounae/pages/authentication/set_passcode/set_passcode_page.dart';
import 'package:mounae/pages/authentication/set_passcode_confirmation/set_passcode_confirmation_page.dart';
import 'package:mounae/pages/authentication/set_username/set_username.dart';
import 'package:mounae/pages/authentication/signin/signin_page.dart';
import 'package:mounae/pages/authentication/signup/signup_page.dart';
import 'package:mounae/pages/connect_bank_onboarding/connect_bank_onboarding.dart';
import 'package:mounae/pages/index/account/accounts/accounts_page.dart';
import 'package:mounae/pages/index/account/bank_account/bank_account_page.dart';
import 'package:mounae/pages/index/account/bank_feature/bank_feature_page.dart';
import 'package:mounae/pages/index/account/choose_bank/choose_bank_page.dart';
import 'package:mounae/pages/index/account/information/information_page.dart';
import 'package:mounae/pages/index/finance/finance/finance_page.dart';
import 'package:mounae/pages/index/overview/overview_page.dart';
import 'package:mounae/pages/onboarding/onboarding_page.dart';
import 'package:mounae/pages/splash/splash_page.dart';
import 'package:mounae/providers/auth_provider.dart';
import 'package:mounae/providers/preference_provider.dart';
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
          // initialRoute: '/',
          routerDelegate: AppRouterDelegate(),
          routeInformationParser: null,
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
      case SignInPage.path:
        builder = SignInPage();
        break;
      case PassCodePage.path:
        builder = PassCodePage();
        break;
      case SignUpPage.path:
        builder = SignUpPage();
        break;
      case OtpSendPage.path:
        builder = OtpSendPage();
        break;
      case OtpVerificationPage.path:
        builder = OtpVerificationPage();
        break;
      case SetUsernamePage.path:
        builder = SetUsernamePage();
        break;
      case SetPassCodePage.path:
        builder = SetPassCodePage();
        break;
      case SetPassCodeConfirmationPage.path:
        builder = SetPassCodeConfirmationPage();
        break;
      case BiometricsOptionPage.path:
        builder = BiometricsOptionPage();
        break;
      case ConnectBankOnboardingPage.path:
        builder = ConnectBankOnboardingPage();
        break;
      case AccountsPage.path:
        builder = AccountsPage();
        break;
      case AccountChooseBankPage.path:
        builder = AccountChooseBankPage();
        break;
      case AccountBankInformationPage.path:
        builder = AccountBankInformationPage();
        break;
      case AccountBankFeaturePage.path:
        builder = AccountBankFeaturePage();
        break;
      case AccountBankAccountPage.path:
        builder = AccountBankAccountPage();
        break;
      case OverviewPage.path:
        builder = OverviewPage();
        break;
      case FinancePage.path:
        builder = FinancePage();
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
