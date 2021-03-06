class HomeScreenResponse {
  String success;
  String message;
  String weekly_common_status;
  String advertisement_url;
  String referal_count;
  String commission_amount;
  String content1;
  String content2;
  String content3;
  List<AdvertisementList> advertisementList;

  HomeScreenResponse({this.success, this.message, this.advertisementList,this.advertisement_url,this.commission_amount,this.referal_count,this.weekly_common_status, this.content1,this.content3,this.content2
  });

  HomeScreenResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'].toString();
    message = json['message'].toString();
    referal_count = json['referal_count'].toString();
    weekly_common_status = json['weekly_common_status'].toString();
    commission_amount = json['commission_amount'].toString();
    content1 = json['content1'];
    content2 = json['content2'];
    content3 = json['content3'];
    advertisement_url = json['advertisement_url'].toString();
    if (json['advertisement_list'] != null) {
      advertisementList = new List<AdvertisementList>();
      json['advertisement_list'].forEach((v) {
        advertisementList.add(new AdvertisementList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['weekly_common_status'] = this.weekly_common_status;
    data['referal_count'] = this.referal_count;
    data['commission_amount'] = this.commission_amount;
    data['advertisement_url'] = this.advertisement_url;
    data['content1'] = this.content1;
    data['content2'] = this.content2;
    data['content3'] = this.content3;
    if (this.advertisementList != null) {
      data['advertisement_list'] =
          this.advertisementList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdvertisementList {
  String id;
  String advertisement;
  String freeOrPaid;
  String likesCount;
  String shareCount;
  String status;
  String createdAt;
  String updatedAt;
  String customerId;
  String category;
  String paidAmount;
  String fileType;
  String transactionId;
  String duration;

  AdvertisementList(
      {this.id,
        this.advertisement,
        this.freeOrPaid,
        this.likesCount,
        this.shareCount,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.customerId,
        this.category,
        this.paidAmount,
        this.fileType,
        this.duration,
        this.transactionId});

  AdvertisementList.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    advertisement = json['advertisement'].toString();
    freeOrPaid = json['free_or_paid'].toString();
    likesCount = json['likes_count'].toString();
    shareCount = json['share_count'].toString();
    status = json['status'].toString();
    duration = json['duration'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    customerId = json['customer_id'].toString();
    category = json['category'].toString();
    paidAmount = json['paid_amount'].toString();
    fileType = json['file_type'].toString();
    transactionId = json['transaction_id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['advertisement'] = this.advertisement;
    data['free_or_paid'] = this.freeOrPaid;
    data['likes_count'] = this.likesCount;
    data['share_count'] = this.shareCount;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['customer_id'] = this.customerId;
    data['duration'] = this.duration;
    data['category'] = this.category;
    data['paid_amount'] = this.paidAmount;
    data['file_type'] = this.fileType;
    data['transaction_id'] = this.transactionId;
    return data;
  }
}
