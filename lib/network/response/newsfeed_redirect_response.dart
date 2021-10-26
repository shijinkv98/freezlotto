class NewsFeedRedirectResponse {
  int success;
  String message;
  List<NewsfeedsListRedirect> newsfeedsListRedirect;
  String priceMoney;
  String newsfeedspresent;

  NewsFeedRedirectResponse(
      {this.success,
        this.message,
        this.newsfeedsListRedirect,
        this.priceMoney,
        this.newsfeedspresent});

  NewsFeedRedirectResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['newsfeeds_list'] != null) {
      newsfeedsListRedirect = new List<NewsfeedsListRedirect>();
      json['newsfeeds_list'].forEach((v) {
        newsfeedsListRedirect.add(new NewsfeedsListRedirect.fromJson(v));
      });
    }
    priceMoney = json['price_money'].toString();
    newsfeedspresent = json['newsfeedspresent'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.newsfeedsListRedirect != null) {
      data['newsfeeds_list'] =
          this.newsfeedsListRedirect.map((v) => v.toJson()).toList();
    }
    data['price_money'] = this.priceMoney;
    data['newsfeedspresent'] = this.newsfeedspresent;
    return data;
  }
}

class NewsfeedsListRedirect {
  String id;
  String newsfeed;
  int likesCount;
  String shareCount;
  int status;
  String createdAt;
  String updatedAt;
  int customerId;
  String createDate;
  int reportCount;
  int likedStatus;
  List<NewsfeedLikes> newsfeedLikes;

  NewsfeedsListRedirect(
      {this.id,
        this.newsfeed,
        this.likesCount,
        this.shareCount,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.customerId,
        this.createDate,
        this.reportCount,
        this.likedStatus,
        this.newsfeedLikes});

  NewsfeedsListRedirect.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    newsfeed = json['newsfeed'];
    likesCount = json['likes_count'];
    shareCount = json['share_count'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customerId = json['customer_id'];
    createDate = json['create_date'];
    reportCount = json['report_count'];
    likedStatus = json['liked_status'];
    if (json['newsfeed_likes'] != null) {
      newsfeedLikes = new List<NewsfeedLikes>();
      json['newsfeed_likes'].forEach((v) {
        newsfeedLikes.add(new NewsfeedLikes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['newsfeed'] = this.newsfeed;
    data['likes_count'] = this.likesCount;
    data['share_count'] = this.shareCount;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['customer_id'] = this.customerId;
    data['create_date'] = this.createDate;
    data['report_count'] = this.reportCount;
    data['liked_status'] = this.likedStatus;
    if (this.newsfeedLikes != null) {
      data['newsfeed_likes'] =
          this.newsfeedLikes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsfeedLikes {
  int id;
  int customerId;
  int newsfeedId;
  String likeable;
  int status;
  String createdAt;
  String updatedAt;

  NewsfeedLikes(
      {this.id,
        this.customerId,
        this.newsfeedId,
        this.likeable,
        this.status,
        this.createdAt,
        this.updatedAt});

  NewsfeedLikes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    newsfeedId = json['newsfeed_id'];
    likeable = json['likeable'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['newsfeed_id'] = this.newsfeedId;
    data['likeable'] = this.likeable;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
