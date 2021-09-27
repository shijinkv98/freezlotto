import 'package:flutter/cupertino.dart';
import 'package:freezlotto/network/response/profile_newsfeed_response.dart';
import 'package:freezlotto/network/response/terms_response.dart';
import 'package:freezlotto/network/response/coupon_list_response.dart';
import 'package:freezlotto/utils/api_services.dart';
import 'package:freezlotto/utils/app_utils.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/utils/alert_utils.dart';

class GalleryBloc extends ChangeNotifier {
  bool isLoading = false;
  List<NewsfeedList> newsfeedList = new List<NewsfeedList>();

  List<Coupens> coupens = new List<Coupens>();
  List<PrizeList> prizeList = new List<PrizeList>();

  List<TermsDetails> termsDetails = new List<TermsDetails>();

  String accountMoney = " ";

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
            accountMoney = couponListResponse.accountMoney;
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

  getProfileNewsFeedData(BuildContext context)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().getProfileNewsFeedListData().then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200){
            ProfileFeedResponse profileFeedResponse = ProfileFeedResponse.fromJson(response.data);
            newsfeedList = profileFeedResponse.newsfeedList;
            notifyListeners();

            if (profileFeedResponse.success == 0) {
              AlertUtils.showToast(profileFeedResponse.message, context);

              // advertisementList = homeScreenResponse.advertisementList;
              //   notifyListeners();
            } else if (profileFeedResponse.success == 3) {
              print("NEED TO LOGIN HERE......");
              kMoveToLogin(context);
            }else if (profileFeedResponse.success == 1) {
              newsfeedList = profileFeedResponse.newsfeedList;

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
  getTermsData(BuildContext context)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().getTermsData().then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200){
            TermsResponse termsScreenResponse =
            TermsResponse.fromJson(response.data);
            // advertisementList = termsScreenResponse.advertisementList;
            // notifyListeners();

            if (termsScreenResponse.success == 0) {
              AlertUtils.showToast(termsScreenResponse.message, context);

              termsDetails = termsScreenResponse.termsDetails;
              //   notifyListeners();
            } else if (termsScreenResponse.success == 3) {
              print("NEED TO LOGIN HERE......");
              kMoveToLogin(context);
            }else if (termsScreenResponse.success == 1) {
              termsDetails = termsScreenResponse.termsDetails;
              notifyListeners();
            }
            // }else {
            //   AlertUtils.showToast(homeScreenResponse.message, context);
            // }

          } else {
            AlertUtils.showToast("Something Went Wrong", context);
          }
        });

      }
    });
  }

}