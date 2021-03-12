import 'package:flutter/material.dart';
import 'package:mounae/models/balance_model.dart';

class UserProvider extends ChangeNotifier {
  List<BalanceModel> _balances = [];

  void addToBalance(BalanceModel balanceModel) {
    _balances.add(balanceModel);
    notifyListeners();
  }

  void addAllToBalance(List<BalanceModel> balanceModel) {
    _balances.addAll(balanceModel);
    notifyListeners();
  }

  List<BalanceModel> get balances => _balances;

  Map<String, dynamic> _connectAccountString;

  set connectAccount(Map<String, dynamic> value) {
    _connectAccountString = value;
    notifyListeners();
  }

  Map<String, dynamic> get connectAccount => _connectAccountString;

  String getCustomerID() {
    return connectAccount['customer_id'];
  }

  double getTotalBalance() {
    double total = 0;
    for (var item in (connectAccount['balance']['data']['formatted'] as List)) {
      double a = item['available_balance'] as double;
      total += a;
    }

    return total;
  }

  List<Map<String, dynamic>> getAccounts() {
    Map<String, dynamic> data = {};

    String bankName = connectAccount['auth']['bank_details']['name'] as String;
    String icon = connectAccount['auth']['bank_details']['icon'] as String;

    for (var item in (connectAccount['balance']['data']['formatted'] as List)) {
      double balance = item['available_balance'] as double;
      String accountType = item['type'] as String;

      data.addAll({
        'balance': balance,
        'type': accountType,
        'bankName': bankName,
        'icon': icon
      });
    }

    return [data];
  }
}
