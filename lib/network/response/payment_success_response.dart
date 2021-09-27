class PaymentSuccessResponse {
  String success;
  String message;

  PaymentSuccessResponse({this.success, this.message});

  PaymentSuccessResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'].toString();
    message = json['message'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}