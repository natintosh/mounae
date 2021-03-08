import 'package:flutter/material.dart';
import 'package:mounae/pages/authentication/biometric_option/biometrics_option_page.dart';
import 'package:mounae/pages/authentication/otp_send/otp_send_page.dart';
import 'package:mounae/pages/authentication/otp_verification/otp_verification_page.dart';
import 'package:mounae/pages/authentication/passcode/passcode_page.dart';
import 'package:mounae/pages/authentication/set_passcode/set_passcode_page.dart';
import 'package:mounae/pages/authentication/set_passcode_confirmation/set_passcode_confirmation_page.dart';
import 'package:mounae/pages/authentication/set_username/set_username.dart';
import 'package:mounae/pages/authentication/signin/signin_page.dart';
import 'package:mounae/pages/authentication/signup/signup_page.dart';
import 'package:mounae/pages/index/index/index_screen.dart';
import 'package:mounae/pages/onboarding/onboarding_page.dart';
import 'package:mounae/pages/splash/splash_page.dart';

part 'configurations.dart';

abstract class PageConfiguration {
  String get name;

  Widget get child;
}
