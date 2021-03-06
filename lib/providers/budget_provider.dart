import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mounae/models/budget_model.dart';
import 'package:mounae/models/expense_model.dart';
import 'package:mounae/models/response_model.dart';
import 'package:mounae/repository/server/mounea_repository.dart';

class BudgetProvider extends ChangeNotifier {
  List<BudgetModel>? _budgetList;

  set budgetList(List<BudgetModel>? value) {
    _budgetList = value;
    notifyListeners();
  }

  List<BudgetModel>? get budgetList => _budgetList;

  List<ExpenseModel>? _expenseList;

  set expenseList(List<ExpenseModel>? value) {
    _expenseList = value;
    notifyListeners();
  }

  List<ExpenseModel>? get expenseList => _expenseList;

  BudgetModel? _selectedBudget;

  BudgetModel? get selectedBudget => _selectedBudget;

  set selectedBudget(BudgetModel? value) {
    _selectedBudget = value;
    notifyListeners();
  }

  void getCustomerBudget() async {
    try {
      ResponseModel? response = await MounaeRepository.getCustomerBudget(
          payload: {"customerId": "08139755032"});

      if (response != null) {
        if (response.responseCode == '00') {
          Object data = response.data!;

          List<BudgetModel> list = (data as List).map<BudgetModel>((e) {
            return BudgetModel.fromJson(e);
          }).toList();

          budgetList = list;
        }
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  void getCustomerExpense() async {
    try {
      ResponseModel? response = await MounaeRepository.getCustomerExpenses(
          payload: {"customerId": "08139755032"});

      if (response != null) {
        if (response.responseCode == '00') {
          Object data = response.data!;

          List<ExpenseModel> list = (data as List).map<ExpenseModel>((e) {
            return ExpenseModel.fromJson(e);
          }).toList();

          expenseList = list;
        }
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
