class CouponListResponse {
  int success;
  String message;
  String accountMoney;
  List<PrizeList> prizeList;
  List<Coupens> coupens;

  CouponListResponse(
      {this.success,
        this.message,
        this.accountMoney,
        this.prizeList,
        this.coupens});

  CouponListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    accountMoney = json['account_money'];
    if (json['prize_list'] != null) {
      prizeList = new List<PrizeList>();
      json['prize_list'].forEach((v) {
        prizeList.add(new PrizeList.fromJson(v));
      });
    }
    if (json['coupens'] != null) {
      coupens = new List<Coupens>();
      json['coupens'].forEach((v) {
        coupens.add(new Coupens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['account_money'] = this.accountMoney;
    if (this.prizeList != null) {
      data['prize_list'] = this.prizeList.map((v) => v.toJson()).toList();
    }
    if (this.coupens != null) {
      data['coupens'] = this.coupens.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrizeList {
  String id;
  String priceName;
  String status;
  String createdAt;
  String updatedAt;

  PrizeList(
      {this.id, this.priceName, this.status, this.createdAt, this.updatedAt});

  PrizeList.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    priceName = json['price_name'].toString();
    status = json['status'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price_name'] = this.priceName;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Coupens {
  String id;
  String coupenImage;
  String status;
  String createdAt;
  String updatedAt;

  Coupens(
      {this.id, this.coupenImage, this.status, this.createdAt, this.updatedAt});

  Coupens.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    coupenImage = json['coupen_image'].toString();
    status = json['status'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coupen_image'] = this.coupenImage;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
