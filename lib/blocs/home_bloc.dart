import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:freezlotto/network/response/ads_uploaded_response.dart';
import 'package:freezlotto/network/response/home_response.dart';
import 'package:freezlotto/network/response/response.dart';
import 'package:freezlotto/network/response/upload_add_contents_response.dart';
import 'package:freezlotto/screens/home_screen.dart';
import 'package:freezlotto/screens/upload_successfull.dart';
import 'package:freezlotto/utils/api_services.dart';
import 'package:freezlotto/utils/app_utils.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/utils/alert_utils.dart';

class HomeBloc extends ChangeNotifier {
  bool isLoading = false;
  String referal_count = "";
  String commission_amount = "";
  // AdvertisementList _advertisementList = new AdvertisementList();
  // AdvertisementList get homeData => _advertisementList;
  // set homeData(AdvertisementList data){
  //   _advertisementList = data;
  //   notifyListeners();
  // }
  List<AdvertisementList> advertisementList = new List<AdvertisementList>();
  AdvertisementContents advertisementContents;
  getHomeData(BuildContext context)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().getHomeData().then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200){
            HomeScreenResponse homeScreenResponse =
            HomeScreenResponse.fromJson(response.data);
            advertisementList = homeScreenResponse.advertisementList;
            referal_count = homeScreenResponse.referal_count;
            commission_amount = homeScreenResponse.commission_amount;
            // notifyListeners();

          if (homeScreenResponse.success == 0) {
          AlertUtils.showToast(homeScreenResponse.message, context);

          // advertisementList = homeScreenResponse.advertisementList;
          //   notifyListeners();
          } else if (homeScreenResponse.success == 3) {
            print("NEED TO LOGIN HERE......");
            kMoveToLogin(context);
          }else if (homeScreenResponse.success == 1) {
            advertisementList = homeScreenResponse.advertisementList;
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
  getAdsContentsData(BuildContext context)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().getAdsContents().then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200){
            UploadAdsContentsResponse uploadAdsContentsResponse =
            UploadAdsContentsResponse.fromJson(response.data);
            advertisementContents = uploadAdsContentsResponse.advertisementContents;

          if (uploadAdsContentsResponse.success == 0) {
          AlertUtils.showToast(uploadAdsContentsResponse.message, context);

          // advertisementList = homeScreenResponse.advertisementList;
          //   notifyListeners();
          } else if (uploadAdsContentsResponse.success == 3) {
            print("NEED TO LOGIN HERE......");
            kMoveToLogin(context);
          }else if (uploadAdsContentsResponse.success == 1) {
            advertisementContents = uploadAdsContentsResponse.advertisementContents;
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

  uploadAds(BuildContext context,File file,String type,String duration,String category)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        // notifyListeners();
        APIService().uploadAds(file,type,duration,category).then((response) {
          isLoading = false;
          // notifyListeners();
          if (response.statusCode == 200) {
            AdsUploadedResponse adsUploadedResponse = AdsUploadedResponse.fromJson(response.data);

            if (adsUploadedResponse.success == 1) {

              AlertUtils.showToast(
                  "NewsFeed successfully updated", context);
              nextPagePushReplacement(context, UploadSuccess());
              // getAddressList(context);
              Navigator.of(context).pop();
            } else if (adsUploadedResponse.success == 3) {
              kMoveToLogin(context);
            } else {
              AlertUtils.showToast(adsUploadedResponse.message, context);
            }
          } else {
            AlertUtils.showToast("Failed", context);
          }
        }

        );
      }
    });

  }
}