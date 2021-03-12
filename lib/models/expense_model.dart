class ExpenseModel {
  String customerId;
  String budgetID;
  String expenseCategory;
  String expenseTitle;
  String expenseAmount;
  String expenseFrequency;
  String expenseStartDate;
  String expenseStartTime;
  String customerConfirmation;
  String createdDate;
  String updatedDate;

  ExpenseModel(
      {this.customerId,
      this.budgetID,
      this.expenseCategory,
      this.expenseTitle,
      this.expenseAmount,
      this.expenseFrequency,
      this.expenseStartDate,
      this.expenseStartTime,
      this.customerConfirmation,
      this.createdDate,
      this.updatedDate});

  ExpenseModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    budgetID = json['budgetID'];
    expenseCategory = json['expenseCategory'];
    expenseTitle = json['expenseTitle'];
    expenseAmount = json['expenseAmount'];
    expenseFrequency = json['expenseFrequency'];
    expenseStartDate = json['expenseStartDate'];
    expenseStartTime = json['expenseStartTime'];
    customerConfirmation = json['customerConfirmation'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['budgetID'] = this.budgetID;
    data['expenseCategory'] = this.expenseCategory;
    data['expenseTitle'] = this.expenseTitle;
    data['expenseAmount'] = this.expenseAmount;
    data['expenseFrequency'] = this.expenseFrequency;
    data['expenseStartDate'] = this.expenseStartDate;
    data['expenseStartTime'] = this.expenseStartTime;
    data['customerConfirmation'] = this.customerConfirmation;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
