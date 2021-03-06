import 'package:flutter/cupertino.dart';
import 'package:freezlotto/network/response/coupon_list_response.dart';
import 'package:freezlotto/network/response/home_response.dart';
import 'package:freezlotto/network/response/newsfeed_like_response.dart';
import 'package:freezlotto/network/response/newsfeed_list_response.dart';
import 'package:freezlotto/network/response/newsfeed_redirect_response.dart';
import 'package:freezlotto/network/response/newsfeed_upload_response.dart';
import 'package:freezlotto/network/response/report_newsfeed_response.dart';
import 'package:freezlotto/network/response/response.dart';
import 'package:freezlotto/screens/home_screen.dart';
import 'package:freezlotto/screens/upload_news_feeds.dart';
import 'package:freezlotto/utils/api_services.dart';
import 'package:freezlotto/utils/app_utils.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/utils/alert_utils.dart';

class NewsFeedBloc extends ChangeNotifier {
  bool isLoading = false;
  List<NewsfeedsList> newsfeedsList = new List<NewsfeedsList>();
  List<NewsfeedsListRedirect> newsfeedsListRedirect = new List<NewsfeedsListRedirect>();

  List<Coupens> coupens = new List<Coupens>();
  List<PrizeList> prizeList = new List<PrizeList>();

  String priceMoney = "";
  String priceMoneyRedirect = "";
  String newsfeedspresent = "";
  String imagePathUrl = "";

  getNewsFeedData(BuildContext context,String newsFeedId)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().getNewsFeedListData(newsFeedId).then((response) {
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
  getNewsFeedRedirectData(BuildContext context,String newsFeedId)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().getNewsFeedListDirectData(newsFeedId).then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200){
            NewsFeedRedirectResponse newsFeedRedirectResponse =
            NewsFeedRedirectResponse.fromJson(response.data);
            priceMoneyRedirect =  newsFeedRedirectResponse.priceMoney;
            newsfeedspresent =  newsFeedRedirectResponse.newsfeedspresent;
            newsfeedsListRedirect = newsFeedRedirectResponse.newsfeedsListRedirect;
            notifyListeners();

          if (newsFeedRedirectResponse.success == 0) {
          AlertUtils.showToast(newsFeedRedirectResponse.message, context);

          // advertisementList = homeScreenResponse.advertisementList;
          //   notifyListeners();
          } else if (newsFeedRedirectResponse.success == 3) {
            print("NEED TO LOGIN HERE......");
            kMoveToLogin(context);
          }else if (newsFeedRedirectResponse.success == 1) {
            newsfeedsListRedirect = newsFeedRedirectResponse.newsfeedsListRedirect;
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

  uploadLink(BuildContext context,String _Link)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        // notifyListeners();
        APIService().uploadNewsfeed(_Link,context).then((response) {
          isLoading = false;
          // notifyListeners();
          if (response.statusCode == 200) {
            NewsFeedUploadResponse newsFeedUploadResponse = NewsFeedUploadResponse
                .fromJson(response.data);
            nextPagePushReplacement(context, HomeScreen(tabnumber: 1,));
            if (newsFeedUploadResponse.success == 1) {
              AlertUtils.showToast(
                  "NewsFeed successfully updated", context);
              // getAddressList(context);
              Navigator.of(context).pop();
            } else if (newsFeedUploadResponse.success == 3) {
              kMoveToLogin(context);
            } else {
              AlertUtils.showToast(newsFeedUploadResponse.message, context);
            }
          } else {
            AlertUtils.showToast("Failed", context);
          }
        });
      }
    });

  }
  reportNewsFeeds(BuildContext context,String newsfeedId)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        // notifyListeners();
        APIService().reportNewsfeeds(newsfeedId).then((response) {
          isLoading = false;
          // notifyListeners();
          if (response.statusCode == 200) {
            ReportResponse reportResponse = ReportResponse
                .fromJson(response.data);
            if (reportResponse.success == 1) {
              AlertUtils.showToast(
                  "NewsFeed successfully updated", context);
              // getAddressList(context);
              Navigator.of(context).pop();
            } else if (reportResponse.success == 3) {
              kMoveToLogin(context);
            } else {
              AlertUtils.showToast(reportResponse.message, context);
            }
          } else {
            AlertUtils.showToast("Failed", context);
          }
        });
      }
    });

  }

  void nextButtonTapped(BuildContext context,NewsFeedBloc newsFeedBloc,String value){
    newsFeedBloc.newsfeedspresent == value? nextPagePushReplacement(context, UploadNewsFeeds()):updateUI(context);
  }
  void updateUI(BuildContext context) {
    getNextData(context);
      //You can also make changes to your state here.
  }

  void onLikeButtonTapped(BuildContext context,String newsfeedid) {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().likeUpdate(newsfeedid).then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200) {
            NewsFeedLikeResponse newsFeedLikeResponse = NewsFeedLikeResponse.fromJson(response.data);
            if (newsFeedLikeResponse.success == 1) {
              AlertUtils.showToast("Liked successfully", context);
              // getAddressList(context);
            nextPagePushReplacement(context, HomeScreen(tabnumber: 1,));
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
  getGalleryData(BuildContext context)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().getGalleryData().then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200){
            CouponListResponse couponListResponse = CouponListResponse.fromJson(response.data);
            coupens = couponListResponse.coupens;
            prizeList = couponListResponse.prizeList;
            imagePathUrl = couponListResponse.imagePathUrl;
            notifyListeners();

            if (couponListResponse.success == 0) {
              AlertUtils.showToast(couponListResponse.message, context);

              // advertisementList = homeScreenResponse.advertisementList;
              //   notifyListeners();
            } else if (couponListResponse.success == 3) {
              print("NEED TO LOGIN HERE......");
              kMoveToLogin(context);
            }else if (couponListResponse.success == 1) {
              coupens = couponListResponse.coupens;
              prizeList = couponListResponse.prizeList;
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



}