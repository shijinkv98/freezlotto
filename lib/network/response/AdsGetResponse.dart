class AdsGetResponse {
  String success;
  String advertismentId;
  String paidAmount;
  Pagecontents pagecontents;

  AdsGetResponse(
      {this.success, this.advertismentId, this.paidAmount, this.pagecontents});

  AdsGetResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'].toString();
    advertismentId = json['advertisment_id'].toString();
    paidAmount = json['paid_amount'].toString();
    pagecontents = json['pagecontents'] != null
        ? new Pagecontents.fromJson(json['pagecontents'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
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
    conten1 = json['conten1'];
    conten2 = json['conten2'];
    conten3 = json['conten3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['conten1'] = this.conten1;
    data['conten2'] = this.conten2;
    data['conten3'] = this.conten3;
    return data;
  }
}
