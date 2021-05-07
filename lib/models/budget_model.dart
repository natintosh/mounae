class BudgetModel {
  String? customerId;
  String? budgetType;
  String? budgetTitle;
  String? bugetAmount;
  String? budgetFrequency;
  String? budgetPeriod;
  String? budgetStartDate;
  String? budgetMonitoringBank;
  String? createdDate;
  String? updatedDate;

  BudgetModel(
      {this.customerId,
      this.budgetType,
      this.budgetTitle,
      this.bugetAmount,
      this.budgetFrequency,
      this.budgetPeriod,
      this.budgetStartDate,
      this.budgetMonitoringBank,
      this.createdDate,
      this.updatedDate});

  BudgetModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    budgetType = json['budgetType'];
    budgetTitle = json['budgetTitle'];
    bugetAmount = json['bugetAmount'];
    budgetFrequency = json['budgetFrequency'];
    budgetPeriod = json['budgetPeriod'];
    budgetStartDate = json['budgetStartDate'];
    budgetMonitoringBank = json['budgetMonitoringBank'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['budgetType'] = this.budgetType;
    data['budgetTitle'] = this.budgetTitle;
    data['bugetAmount'] = this.bugetAmount;
    data['budgetFrequency'] = this.budgetFrequency;
    data['budgetPeriod'] = this.budgetPeriod;
    data['budgetStartDate'] = this.budgetStartDate;
    data['budgetMonitoringBank'] = this.budgetMonitoringBank;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
