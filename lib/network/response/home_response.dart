class HomeScreenResponse {
  String success;
  String message;
  String advertisement_url;
  List<AdvertisementList> advertisementList;

  HomeScreenResponse({this.success, this.message, this.advertisementList,this.advertisement_url});

  HomeScreenResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'].toString();
    message = json['message'].toString();
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
    data['advertisement_url'] = this.advertisement_url;
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
  String duration;
  String category;
  String paidAmount;
  String fileType;
  String transactionId;

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
        this.duration,
        this.category,
        this.paidAmount,
        this.fileType,
        this.transactionId});

  AdvertisementList.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    advertisement = json['advertisement'].toString();
    freeOrPaid = json['free_or_paid'].toString();
    likesCount = json['likes_count'].toString();
    shareCount = json['share_count'].toString();
    status = json['status'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    customerId = json['customer_id'].toString();
    duration = json['duration'].toString();
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
