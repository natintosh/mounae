import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mounae/models/budget_model.dart';
import 'package:mounae/models/response_model.dart';
import 'package:mounae/repository/server/mounea_repository.dart';

class BudgetProvider extends ChangeNotifier {
  String _customerID = "08139755032";
  String _budgetTitle;
  String _budgetAmount;
  String _budgetFrequency;
  String _budgetPeriod;
  String _budgetStartDate;
  String _budgetMonitoringBank;

  List<BudgetModel> _budgetList;

  set budgetList(List<BudgetModel> value) {
    _budgetList = value;
    notifyListeners();
  }

  List<BudgetModel> get budgetList => _budgetList;

  void getCustomerBudget() async {
    try {
      ResponseModel response = await MounaeRepository.getCustomerBudget(
          payload: {"customerId": "08139755032"});

      if (response != null) {
        if (response.responseCode == '00') {
          Object data = response.data;

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
}
