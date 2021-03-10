import 'package:flutter/material.dart';
import 'package:mounae/screens/authentication/biometric_option/biometrics_option_screen.dart';
import 'package:mounae/screens/authentication/otp_send/otp_send_screen.dart';
import 'package:mounae/screens/authentication/otp_verification/otp_verification_screen.dart';
import 'package:mounae/screens/authentication/passcode/passcode_screen.dart';
import 'package:mounae/screens/authentication/set_passcode/set_passcode_screen.dart';
import 'package:mounae/screens/authentication/set_passcode_confirmation/set_passcode_confirmation_screen.dart';
import 'package:mounae/screens/authentication/set_username/set_username_screen.dart';
import 'package:mounae/screens/authentication/signin/signin_screen.dart';
import 'package:mounae/screens/authentication/signup/signup_screen.dart';
import 'package:mounae/screens/connect_bank_onboarding/connect_bank_onboarding_screen.dart';
import 'package:mounae/screens/index/account/accounts/accounts_screen.dart';
import 'package:mounae/screens/index/account/bank_account/bank_account_screen.dart';
import 'package:mounae/screens/index/account/bank_feature/bank_feature_screen.dart';
import 'package:mounae/screens/index/account/choose_bank/choose_bank_screen.dart';
import 'package:mounae/screens/index/account/information/information_screen.dart';
import 'package:mounae/screens/index/budget/budget/budget_screen.dart';
import 'package:mounae/screens/index/budget/create_budget_plan/create_budget_plan_screen.dart';
import 'package:mounae/screens/index/budget/income_plan/income_amount_screen.dart';
import 'package:mounae/screens/index/budget/income_plan/income_plan_screen.dart';
import 'package:mounae/screens/index/finance/finance/finance_screen.dart';
import 'package:mounae/screens/index/index/index_screen.dart';
import 'package:mounae/screens/index/settings/settings/settings_screen.dart';
import 'package:mounae/screens/onboarding/onboarding_screen.dart';
import 'package:mounae/screens/splash/splash_screen.dart';

part 'configurations/auth_configurations.dart';
part 'configurations/index_configurations.dart';

abstract class PageConfiguration {
  String get name;

  Widget get child;
}
