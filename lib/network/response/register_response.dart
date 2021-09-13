class RegisterResponse {
  String success;
  String message;
  String customerId;
  String customerMobile;

  RegisterResponse(
      {this.success,
        this.message,
        this.customerId,
        this.customerMobile});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'].toString();
    message = json['message'].toString();
    customerId = json['customerId'].toString();
    customerMobile = json['customerMobile'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['customerId'] = this.customerId;
    data['customerMobile'] = this.customerMobile;
    return data;
  }
}