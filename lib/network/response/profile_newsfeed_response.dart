class ProfileFeedResponse {
  int success;
  String message;
  List<NewsfeedList> newsfeedList;

  ProfileFeedResponse({this.success, this.message, this.newsfeedList});

  ProfileFeedResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['newsfeed_list'] != null) {
      newsfeedList = new List<NewsfeedList>();
      json['newsfeed_list'].forEach((v) {
        newsfeedList.add(new NewsfeedList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.newsfeedList != null) {
      data['newsfeed_list'] = this.newsfeedList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsfeedList {
  String id;
  String newsfeed;
  String likesCount;
  String shareCount;
  String status;
  String createdAt;
  String updatedAt;
  String customerId;
  String createDate;

  NewsfeedList(
      {this.id,
        this.newsfeed,
        this.likesCount,
        this.shareCount,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.customerId,
        this.createDate});

  NewsfeedList.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    newsfeed = json['newsfeed'].toString();
    likesCount = json['likes_count'].toString();
    shareCount = json['share_count'].toString();
    status = json['status'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    customerId = json['customer_id'].toString();
    createDate = json['create_date'].toString();
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
    return data;
  }
}
