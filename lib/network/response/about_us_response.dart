class AboutUsResponse {
  int success;
  String message;
  List<AboutDetails> aboutDetails;

  AboutUsResponse({this.success, this.message, this.aboutDetails});

  AboutUsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['about_details'] != null) {
      aboutDetails = new List<AboutDetails>();
      json['about_details'].forEach((v) {
        aboutDetails.add(new AboutDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.aboutDetails != null) {
      data['about_details'] = this.aboutDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AboutDetails {
  int id;
  String page;
  String fieldName;
  String fieldValue;
  String fieldType;
  String fieldWidth;
  String fieldCaption;
  String fieldHeight;
  String createdAt;
  String updatedAt;

  AboutDetails(
      {this.id,
        this.page,
        this.fieldName,
        this.fieldValue,
        this.fieldType,
        this.fieldWidth,
        this.fieldCaption,
        this.fieldHeight,
        this.createdAt,
        this.updatedAt});

  AboutDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    page = json['page'];
    fieldName = json['field_name'];
    fieldValue = json['field_value'];
    fieldType = json['field_type'];
    fieldWidth = json['field_width'];
    fieldCaption = json['field_caption'];
    fieldHeight = json['field_height'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page'] = this.page;
    data['field_name'] = this.fieldName;
    data['field_value'] = this.fieldValue;
    data['field_type'] = this.fieldType;
    data['field_width'] = this.fieldWidth;
    data['field_caption'] = this.fieldCaption;
    data['field_height'] = this.fieldHeight;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

