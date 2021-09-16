class AdsUploadedResponse {
  String success;
  String message;

  AdsUploadedResponse({this.success, this.message});

  AdsUploadedResponse.fromJson(Map<String, dynamic> json) {
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