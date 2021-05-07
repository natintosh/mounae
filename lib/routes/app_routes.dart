import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mounae/global/views/connect_account/connect_account_view.dart';
import 'package:mounae/routes/pages/modal_slide_transition_page.dart';
import 'package:mounae/screens/authentication/biometric_option/biometrics_option_screen.dart';
import 'package:mounae/screens/authentication/otp_send/otp_send_screen.dart';
import 'package:mounae/screens/authentication/otp_verification/otp_verification_screen.dart';
import 'package:mounae/screens/authentication/passcode/passcode_screen.dart';
import 'package:mounae/screens/authentication/set_passcode/set_passcode_screen.dart';
import 'package:mounae/screens/authentication/set_passcode_confirmation/set_passcode_confirmation_screen.dart';
import 'package:mounae/screens/authentication/set_username/set_username_screen.dart';
import 'package:mounae/screens/authentication/signin/signin_screen.dart';
import 'package:mounae/screens/authentication/signup/signup_screen.dart';
import 'package:mounae/screens/index/account/accounts/accounts_screen.dart';
import 'package:mounae/screens/index/account/bank_account/bank_account_screen.dart';
import 'package:mounae/screens/index/account/bank_feature/bank_feature_screen.dart';
import 'package:mounae/screens/index/account/onboarding/onboarding_screen.dart';
import 'package:mounae/screens/index/index/index_screen.dart';
import 'package:mounae/screens/onboarding/onboarding_screen.dart';
import 'package:mounae/screens/splash/splash_screen.dart';

class AppLocation extends BeamLocation {
  AppLocation(BeamState state) : super(state);

  @override
  List<String> get pathBlueprints => ['/onboarding'];

  @override
  List<BeamPage> pagesBuilder(BuildContext context, BeamState state) {
    return <BeamPage>[
      if (state.uri.pathSegments.isEmpty)
        BeamPage(
          key: ValueKey('splash-screen'),
          child: SplashScreen(),
        ),
      if (state.uri.pathSegments.contains('onboarding'))
        BeamPage(
          key: ValueKey('onboarding'),
          child: OnBoardingScreen(),
        ),
    ];
  }
}

class AuthenticationLocation extends BeamLocation {
  AuthenticationLocation(BeamState state) : super(state);

  @override
  List<String> get pathBlueprints => [
        '/authentication/signin',
        '/authentication/signup',
        '/authentication/biometric-option',
        '/authentication/send-otp',
        '/authentication/verify-otp',
        '/authentication/passcode',
        '/authentication/set-passcode/confirmation',
        '/authentication/set-username',
      ];

  @override
  List<BeamPage> pagesBuilder(BuildContext context, BeamState state) {
    return <BeamPage>[
      if (state.uri.pathSegments.contains('signin'))
        BeamPage(
          key: ValueKey('signin'),
          child: SignInScreen(),
        ),
      if (state.uri.pathSegments.contains('signup'))
        BeamPage(
          key: ValueKey('signup'),
          child: SignUpScreen(),
        ),
      if (state.uri.pathSegments.contains('passcode'))
        BeamPage(
          key: ValueKey('passcode'),
          child: PassCodeScreen(),
        ),
      if (state.uri.pathSegments.contains('send-otp'))
        BeamPage(
          key: ValueKey('send-otp'),
          child: OtpSendScreen(),
        ),
      if (state.uri.pathSegments.contains('verify-otp'))
        BeamPage(
          key: ValueKey('verify-otp'),
          child: OtpVerificationScreen(),
        ),
      if (state.uri.pathSegments.contains('set-username'))
        BeamPage(
          key: ValueKey('set-username'),
          child: SetUsernameScreen(),
        ),
      if (state.uri.pathSegments.contains('set-passcode'))
        BeamPage(
          key: ValueKey('set-passcode'),
          child: SetPassCodeScreen(),
        ),
      if (state.uri.pathSegments.contains('confirmation'))
        BeamPage(
          key: ValueKey('set-passcode-confirmation'),
          child: SetPassCodeConfirmationScreen(),
        ),
      if (state.uri.pathSegments.contains('biometric-option'))
        BeamPage(
          key: ValueKey('biometric-option'),
          child: BiometricsOptionScreen(),
        ),
    ];
  }
}

class IndexLocation extends BeamLocation {
  IndexLocation(BeamState state) : super(state);

  @override
  List<String> get pathBlueprints => [
        '/index',
        '/index/accounts/:accountId',
        '/index/accounts/onboarding',
        '/index/accounts/add',
        '/index/accounts/connect',
        '/index/budget',
        '/index/finance',
        '/index/overview',
        '/index/settings',
      ];

  @override
  List<BeamPage> pagesBuilder(BuildContext context, BeamState state) {
    return <BeamPage>[
      if (state.uri.pathSegments.contains('index'))
        BeamPage(
          key: ValueKey('index'),
          child: IndexScreen(),
        ),
      if (state.uri.pathSegments.contains('accounts'))
        BeamPage(
          key: ValueKey('accounts'),
          child: AccountsScreen(),
        ),
      if (state.uri.pathSegments.contains('accountId'))
        BeamPage(
          key: ValueKey('account-bank-account'),
          child: AccountBankAccountScreen(),
        ),
      if (state.uri.pathSegments.contains('add'))
        BeamPage(
          key: ValueKey('account-add'),
          child: AccountBankFeatureScreen(),
        ),
      if (state.uri.pathSegments.contains('onboarding'))
        BeamPage(
          key: ValueKey('account-onboarding'),
          child: AccountOnBoardingScreen(),
        ),
      if (state.uri.pathSegments.contains('connect'))
        ModalSlideTransitionPage(
          key: ValueKey('account-connect'),
          child: GlobalConnectAccountView(),
        ),
    ];
  }
}
