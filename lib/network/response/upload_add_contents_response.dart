class UploadAdsContentsResponse {
  String success;
  String message;
  AdvertisementContents advertisementContents;

  UploadAdsContentsResponse(
      {this.success, this.message, this.advertisementContents});

  UploadAdsContentsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'].toString();
    message = json['message'].toString();
    advertisementContents = json[' advertisement_contents'] != null
        ? new AdvertisementContents.fromJson(json[' advertisement_contents'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.advertisementContents != null) {
      data[' advertisement_contents'] = this.advertisementContents.toJson();
    }
    return data;
  }
}

class AdvertisementContents {
  String conten1;
  String conten2;
  String conten3;

  AdvertisementContents({this.conten1, this.conten2, this.conten3});

  AdvertisementContents.fromJson(Map<String, dynamic> json) {
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
