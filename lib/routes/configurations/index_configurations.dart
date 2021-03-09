part of '../page_configuration.dart';

class IndexConfiguration extends PageConfiguration {
  static const String path = IndexScreen.path;

  @override
  Widget get child => IndexScreen();

  @override
  String get name => path;
}

class FinanceConfiguration extends PageConfiguration {
  static const String path = FinanceScreen.path;

  @override
  Widget get child => FinanceScreen();

  @override
  String get name => path;
}

class AccountConfiguration extends PageConfiguration {
  static const String path = AccountsScreen.path;

  @override
  Widget get child => AccountsScreen();

  @override
  String get name => path;
}

class AccountBankAccountConfiguration extends PageConfiguration {
  static const String path = AccountBankAccountScreen.path;

  @override
  Widget get child => AccountBankAccountScreen();

  @override
  String get name => path;
}

class AccountBankFeatureConfiguration extends PageConfiguration {
  static const String path = AccountBankFeatureScreen.path;

  @override
  Widget get child => AccountBankFeatureScreen();

  @override
  String get name => path;
}

class AccountChooseBankConfiguration extends PageConfiguration {
  static const String path = AccountChooseBankScreen.path;

  @override
  Widget get child => AccountChooseBankScreen();

  @override
  String get name => path;
}

class AccountBankInformationConfiguration extends PageConfiguration {
  static const String path = AccountBankInformationScreen.path;

  @override
  Widget get child => AccountBankInformationScreen();

  @override
  String get name => path;
}

class SettingsConfiguration extends PageConfiguration {
  static const String path = SettingsScreen.path;

  @override
  Widget get child => SettingsScreen();

  @override
  String get name => path;
}

class BudgetConfiguration extends PageConfiguration {
  static const String path = BudgetScreen.path;

  @override
  Widget get child => BudgetScreen();

  @override
  String get name => path;
}
