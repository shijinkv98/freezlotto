class NewsFeedRedirectResponse {
  String success;
  String message;
  List<NewsfeedsList> newsfeedsList;
  String priceMoney;
  String newsfeedspresent;

  NewsFeedRedirectResponse(
      {this.success,
        this.message,
        this.newsfeedsList,
        this.priceMoney,
        this.newsfeedspresent});

  NewsFeedRedirectResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'].toString();
    message = json['message'].toString();
    if (json['newsfeeds_list'] != null) {
      newsfeedsList = new List<NewsfeedsList>();
      json['newsfeeds_list'].forEach((v) {
        newsfeedsList.add(new NewsfeedsList.fromJson(v));
      });
    }
    priceMoney = json['price_money'].toString();
    newsfeedspresent = json['newsfeedspresent'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.newsfeedsList != null) {
      data['newsfeeds_list'] =
          this.newsfeedsList.map((v) => v.toJson()).toList();
    }
    data['price_money'] = this.priceMoney;
    data['newsfeedspresent'] = this.newsfeedspresent;
    return data;
  }
}

class NewsfeedsList {
  String id;
  String newsfeed;
  String likesCount;
  String shareCount;
  String status;
  String createdAt;
  String updatedAt;
  String customerId;
  String createDate;
  String reportCount;
  String likedStatus;
  List<NewsfeedLikes> newsfeedLikes;

  NewsfeedsList(
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

  NewsfeedsList.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    newsfeed = json['newsfeed'].toString();
    likesCount = json['likes_count'].toString();
    shareCount = json['share_count'].toString();
    status = json['status'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    customerId = json['customer_id'].toString();
    createDate = json['create_date'].toString();
    reportCount = json['report_count'].toString();
    likedStatus = json['liked_status'].toString();
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
  String id;
  String customerId;
  String newsfeedId;
  String likeable;
  String status;
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
    id = json['id'].toString();
    customerId = json['customer_id'].toString();
    newsfeedId = json['newsfeed_id'].toString();
    likeable = json['likeable'].toString();
    status = json['status'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
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

