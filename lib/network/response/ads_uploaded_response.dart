class UploadResponse {
  String success;
  String message;
  String advertismentId;
  String paidAmount;

  UploadResponse(
      {this.success, this.message, this.advertismentId, this.paidAmount});

  UploadResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'].toString();
    message = json['message'].toString();
    advertismentId = json['advertisment_id'].toString();
    paidAmount = json['paid_amount'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['advertisment_id'] = this.advertismentId;
    data['paid_amount'] = this.paidAmount;
    return data;
  }
}
