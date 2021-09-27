class AdsUploadedResponse {
  String success;
  String message;
  String advertismentId;
  String paidAmount;
  Pagecontents pagecontents;

  AdsUploadedResponse(
      {this.success,
        this.message,
        this.advertismentId,
        this.paidAmount,
        this.pagecontents});

  AdsUploadedResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'].toString();
    message = json['message'].toString();
    advertismentId = json['advertisment_id'].toString();
    paidAmount = json['paid_amount'].toString();
    pagecontents = json['pagecontents'] != null
        ? new Pagecontents.fromJson(json['pagecontents'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['advertisment_id'] = this.advertismentId;
    data['paid_amount'] = this.paidAmount;
    if (this.pagecontents != null) {
      data['pagecontents'] = this.pagecontents.toJson();
    }
    return data;
  }
}

class Pagecontents {
  String conten1;
  String conten2;
  String conten3;

  Pagecontents({this.conten1, this.conten2, this.conten3});

  Pagecontents.fromJson(Map<String, dynamic> json) {
    conten1 = json['conten1'].toString();
    conten2 = json['conten2'].toString();
    conten3 = json['conten3'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['conten1'] = this.conten1;
    data['conten2'] = this.conten2;
    data['conten3'] = this.conten3;
    return data;
  }
}
