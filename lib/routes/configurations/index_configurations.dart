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

class BudgetCreateBudgetPlanConfiguration extends PageConfiguration {
  static const String path = BudgetCreateBudgetPlanScreen.path;

  @override
  Widget get child => BudgetCreateBudgetPlanScreen();

  @override
  String get name => path;
}

class BudgetExpensePlanConfiguration extends PageConfiguration {
  static const String path = BudgetExpensePlanScreen.path;

  @override
  Widget get child => BudgetExpensePlanScreen();

  @override
  String get name => path;
}

class BudgetExpenseAmountConfiguration extends PageConfiguration {
  static const String path = BudgetExpenseAmountScreen.path;

  @override
  Widget get child => BudgetExpenseAmountScreen();

  @override
  String get name => path;
}

class BudgetExpenseChoosePlanConfiguration extends PageConfiguration {
  static const String path = BudgetExpenseChoosePlanTypeScreen.path;

  @override
  Widget get child => BudgetExpenseChoosePlanTypeScreen();

  @override
  String get name => path;
}

class BudgetExpensePeriodicPlanConfiguration extends PageConfiguration {
  static const String path = BudgetExpensePeriodicPlanScreen.path;

  @override
  Widget get child => ChangeNotifierProvider(
      create: (context) {
        return DatePickerProvider();
      },
      child: BudgetExpensePeriodicPlanScreen());

  @override
  String get name => path;
}

class BudgetExpenseBudgetDetailsConfiguration extends PageConfiguration {
  static const String path = BudgetExpenseBudgetDetailsScreen.path;

  @override
  Widget get child => BudgetExpenseBudgetDetailsScreen();

  @override
  String get name => path;
}
