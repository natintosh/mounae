import 'package:flutter/material.dart';
import 'package:mounae/providers/date_picker_provider.dart';
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
import 'package:mounae/screens/index/account/depreciated/choose_bank/choose_bank_screen.dart';
import 'package:mounae/screens/index/account/depreciated/information/information_screen.dart';
import 'package:mounae/screens/index/account/onboarding/onboarding_screen.dart';
import 'package:mounae/screens/index/budget/budget/budget_screen.dart';
import 'package:mounae/screens/index/budget/create_budget_plan/create_budget_plan_screen.dart';
import 'package:mounae/screens/index/budget/plans/expense_plan/budget_details/budget_details.dart';
import 'package:mounae/screens/index/budget/plans/expense_plan/choose_plan_type/choose_plan_type.dart';
import 'package:mounae/screens/index/budget/plans/expense_plan/create_budget/create_budget_screen.dart';
import 'package:mounae/screens/index/budget/plans/expense_plan/create_budget_bill_settings/budget_expense_bills_settings.dart';
import 'package:mounae/screens/index/budget/plans/expense_plan/create_budget_expense/budget_expense_details_screen.dart';
import 'package:mounae/screens/index/budget/plans/expense_plan/expense_amount/expense_amount_screen.dart';
import 'package:mounae/screens/index/budget/plans/expense_plan/expense_plan/expense_plan_screen.dart';
import 'package:mounae/screens/index/budget/plans/expense_plan/periodic_plan/periodic_plan_screen.dart';
import 'package:mounae/screens/index/finance/finance/finance_screen.dart';
import 'package:mounae/screens/index/index/index_screen.dart';
import 'package:mounae/screens/index/settings/settings/settings_screen.dart';
import 'package:mounae/screens/onboarding/onboarding_screen.dart';
import 'package:mounae/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

part 'configurations/auth_configurations.dart';
part 'configurations/index_configurations.dart';

abstract class PageConfiguration {
  String get name;

  Widget get child;

  late Object arguments;
}
