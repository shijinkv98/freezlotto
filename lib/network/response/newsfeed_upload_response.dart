class NewsFeedUploadResponse {
  String success;
  String message;

  NewsFeedUploadResponse({this.success, this.message});

  NewsFeedUploadResponse.fromJson(Map<String, dynamic> json) {
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