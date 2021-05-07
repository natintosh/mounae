import 'package:mounae/models/account_model.dart';

class BankListModel {
  double? totalBalance;
  List<BankAccount>? accounts;

  BankListModel({this.totalBalance, this.accounts});

  BankListModel.fromJson(Map<String, dynamic> json) {
    totalBalance = json['total_balance'];
    if (json['accounts'] != null) {
      accounts = new List<BankAccount>.empty(growable: true);
      json['accounts'].forEach((v) {
        accounts!.add(new BankAccount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_balance'] = this.totalBalance;
    if (this.accounts != null) {
      data['accounts'] = this.accounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
