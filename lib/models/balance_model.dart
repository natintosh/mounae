class BalanceModel {
  String currency;
  String type;
  String nuban;
  String status;
  String name;
  double availableBalance;
  double ledgerBalance;
  String record;
  String account;
  bool connected;

  BalanceModel(
      {this.currency,
      this.type,
      this.nuban,
      this.status,
      this.name,
      this.availableBalance,
      this.ledgerBalance,
      this.record,
      this.account,
      this.connected});

  BalanceModel.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    type = json['type'];
    nuban = json['nuban'];
    status = json['status'];
    name = json['name'];
    availableBalance = json['available_balance'];
    ledgerBalance = json['ledger_balance'];
    record = json['record'];
    account = json['account'];
    connected = json['connected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['type'] = this.type;
    data['nuban'] = this.nuban;
    data['status'] = this.status;
    data['name'] = this.name;
    data['available_balance'] = this.availableBalance;
    data['ledger_balance'] = this.ledgerBalance;
    data['record'] = this.record;
    data['account'] = this.account;
    data['connected'] = this.connected;
    return data;
  }
}
