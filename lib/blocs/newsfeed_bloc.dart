import 'package:flutter/cupertino.dart';
import 'package:freezlotto/network/response/home_response.dart';
import 'package:freezlotto/network/response/newsfeed_like_response.dart';
import 'package:freezlotto/network/response/newsfeed_list_response.dart';
import 'package:freezlotto/network/response/newsfeed_upload_response.dart';
import 'package:freezlotto/network/response/response.dart';
import 'package:freezlotto/screens/upload_news_feeds.dart';
import 'package:freezlotto/utils/api_services.dart';
import 'package:freezlotto/utils/app_utils.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/utils/alert_utils.dart';

class NewsFeedBloc extends ChangeNotifier {
  bool isLoading = false;
  List<NewsfeedsList> newsfeedsList = new List<NewsfeedsList>();
  String priceMoney = "";
  String newsfeedspresent = "";

  getNewsFeedData(BuildContext context)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().getNewsFeedListData().then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200){
            NewsFeedListResponse newsFeedListResponse =
            NewsFeedListResponse.fromJson(response.data);
            priceMoney =  newsFeedListResponse.priceMoney;
            newsfeedspresent =  newsFeedListResponse.newsfeedspresent;
            newsfeedsList = newsFeedListResponse.newsfeedsList;
            notifyListeners();

          if (newsFeedListResponse.success == 0) {
          AlertUtils.showToast(newsFeedListResponse.message, context);

          // advertisementList = homeScreenResponse.advertisementList;
          //   notifyListeners();
          } else if (newsFeedListResponse.success == 3) {
            print("NEED TO LOGIN HERE......");
            kMoveToLogin(context);
          }else if (newsFeedListResponse.success == 1) {
            newsfeedsList = newsFeedListResponse.newsfeedsList;

            notifyListeners();
          }
          // }else {
          //   AlertUtils.showToast(homeScreenResponse.message, context);
          // }

        } else {
        AlertUtils.showToast("Login Failed", context);
        }
        });
      }
    });
  }

  getNextData(BuildContext context)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().getNextListData().then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200){
            NewsFeedListResponse newsFeedListResponse =
            NewsFeedListResponse.fromJson(response.data);
            priceMoney =  newsFeedListResponse.priceMoney;
            newsfeedsList = newsFeedListResponse.newsfeedsList;
            notifyListeners();

          if (newsFeedListResponse.success == 0) {
          AlertUtils.showToast(newsFeedListResponse.message, context);

          // advertisementList = homeScreenResponse.advertisementList;
          //   notifyListeners();
          } else if (newsFeedListResponse.success == 3) {
            print("NEED TO LOGIN HERE......");
            kMoveToLogin(context);
          }else if (newsFeedListResponse.success == 1) {
            newsfeedsList = newsFeedListResponse.newsfeedsList;

            notifyListeners();
          }
          // }else {
          //   AlertUtils.showToast(homeScreenResponse.message, context);
          // }

        } else {
        AlertUtils.showToast("Login Failed", context);
        }
        });
      }
    });
  }

  void nextButtonTapped(BuildContext context,NewsFeedBloc newsFeedBloc,String value){
    newsFeedBloc.newsfeedspresent == value?
    nextPagePushReplacement(context, UploadNewsFeeds()):Container();
  }

  void onLikeButtonTapped(BuildContext context,String newsfeedid) {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        // notifyListeners();
        APIService().likeUpdate(newsfeedid).then((response) {
          isLoading = false;
          // notifyListeners();
          if (response.statusCode == 200) {
            NewsFeedLikeResponse newsFeedLikeResponse = NewsFeedLikeResponse.fromJson(response.data);
            if (newsFeedLikeResponse.success == 1) {
              AlertUtils.showToast("Address successfully updated", context);
              // getAddressList(context);
              Navigator.of(context).pop();
            } else if (newsFeedLikeResponse.success == 3) {
              kMoveToLogin(context);
            } else {
              AlertUtils.showToast(newsFeedLikeResponse.message, context);
            }
          } else {
            AlertUtils.showToast("Failed", context);
          }
        });
      }
    });

  }


}