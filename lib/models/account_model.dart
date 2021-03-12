class BankAccount {
  String currency;
  String nuban;
  String status;
  String name;
  String availableBalance;
  String ledgerBalance;
  String bankName;
  String slug;
  String logo;

  BankAccount(
      {this.currency,
      this.nuban,
      this.status,
      this.name,
      this.availableBalance,
      this.ledgerBalance,
      this.bankName,
      this.slug,
      this.logo});

  BankAccount.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    nuban = json['nuban'];
    status = json['status'];
    name = json['name'];
    availableBalance = json['available_balance'];
    ledgerBalance = json['ledger_balance'];
    bankName = json['bank_name'];
    slug = json['slug'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['nuban'] = this.nuban;
    data['status'] = this.status;
    data['name'] = this.name;
    data['available_balance'] = this.availableBalance;
    data['ledger_balance'] = this.ledgerBalance;
    data['bank_name'] = this.bankName;
    data['slug'] = this.slug;
    data['logo'] = this.logo;
    return data;
  }
}
