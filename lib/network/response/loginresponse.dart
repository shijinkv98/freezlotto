class LoginResponse {
  int success;
  String message;
  int customerId;
  String customerMobile;

  LoginResponse(
      {this.success, this.message, this.customerId, this.customerMobile});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    customerId = json['customerId'];
    customerMobile = json['customerMobile'];
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