class ResponseModel<T> {
  String? responseCode;
  String? responseMessage;
  String? userMessage;
  Object? data;

  ResponseModel({
    this.responseCode,
    this.responseMessage,
    this.userMessage,
    this.data,
  });

  ResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
    userMessage = json['userMessage'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    data['userMessage'] = this.userMessage;
    data['data'] = this.data;
    return data;
  }
}
