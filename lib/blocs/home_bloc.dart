import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:freezlotto/network/response/AdsGetResponse.dart';
import 'package:freezlotto/network/response/ads_uploaded_response.dart';
import 'package:freezlotto/network/response/home_response.dart';
import 'package:freezlotto/network/response/payment_success_response.dart';
import 'package:freezlotto/network/response/response.dart';
import 'package:freezlotto/network/response/upload_add_contents_response.dart';
import 'package:freezlotto/screens/home_screen.dart';
import 'package:freezlotto/screens/payment_details_screen.dart';
import 'package:freezlotto/screens/upload_successfull.dart';
import 'package:freezlotto/utils/api_services.dart';
import 'package:freezlotto/utils/app_utils.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/utils/alert_utils.dart';

class HomeBloc extends ChangeNotifier {
  bool isLoading = false;
  String referal_count = "";
  String commission_amount = "";
  String advertisment_id = "";
  String paid_amount = "";
  // String get_paid_amount = "";
  String addId = "";
  // String add_Id = "";
  String conten1 = "";
  String conten2 = "";
  String conten3 = "";
  Pagecontents pagecontents;
  String adUrl="https://freezelotto.alisonsdemo.online/images/advertisement/";
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
            adUrl=homeScreenResponse.advertisement_url;
            // notifyListeners();

          if (homeScreenResponse.success ==" 0") {
          AlertUtils.showToast(homeScreenResponse.message, context);

          // advertisementList = homeScreenResponse.advertisementList;
          //   notifyListeners();
          } else if (homeScreenResponse.success == "3") {
            print("NEED TO LOGIN HERE......");
            kMoveToLogin(context);

          }else if (homeScreenResponse.success ==" 1") {
            advertisementList = homeScreenResponse.advertisementList;
            adUrl=homeScreenResponse.advertisement_url;
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

  uploadAdsVideo(BuildContext context,File file,String type,String duration,String category)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().uploadVideo(context,file,type,duration,category).then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200) {
            UploadResponse uploadResponse = UploadResponse.fromJson(response.data);
            advertisment_id = uploadResponse.advertismentId;
            paid_amount = uploadResponse.paidAmount;

            if (uploadResponse.success == '1') {

              AlertUtils.showToast(
                  "Successfully updated", context);
              nextPagePushReplacement(context, type=="free" ? UploadSuccess(): PaymentDetailsScreen(ads_id: advertisment_id,amount: paid_amount,));
              // nextPagePushReplacement(context, UploadSuccess());
              // getAddressList(context);
              // Navigator.of(context).pop();
            } else if (uploadResponse.success == '3') {
              kMoveToLogin(context);
            } else {

              AlertUtils.showToast(uploadResponse.message, context);
            }
          } else {
            AlertUtils.showToast("Failed", context);
          }
        }

        );
      }
    });
  }
  uploadAdsImage(BuildContext context,File file,String type,String duration,String category)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().uploadImage(context,file,type,duration,category).then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200) {
            UploadResponse uploadResponse = UploadResponse.fromJson(response.data);
            advertisment_id = uploadResponse.advertismentId;
            paid_amount = uploadResponse.paidAmount;

            if (uploadResponse.success == '1') {

              AlertUtils.showToast(
                  "Successfully updated", context);
              nextPagePushReplacement(context, type=="free" ? UploadSuccess(): PaymentDetailsScreen(ads_id: advertisment_id,amount: paid_amount,));
              // nextPagePushReplacement(context, UploadSuccess());
              // getAddressList(context);
              // Navigator.of(context).pop();
            } else if (uploadResponse.success == '3') {
              kMoveToLogin(context);
            } else {

              AlertUtils.showToast(uploadResponse.message, context);
            }
          } else {
            AlertUtils.showToast("Failed", context);
          }
        }

        );
      }
    });
  }
  getAdsData(BuildContext context)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().getAdsData(advertisment_id,paid_amount).then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200) {
            AdsGetResponse adsGetResponse = AdsGetResponse.fromJson(response.data);
            addId = adsGetResponse.advertismentId;
            // g_paid/_amount = adsGetResponse.paidAmount;
            pagecontents = adsGetResponse.pagecontents;
            conten3=adsGetResponse.pagecontents.conten3;
            conten2=adsGetResponse.pagecontents.conten2;
            conten1=adsGetResponse.pagecontents.conten1;

            if (adsGetResponse.success == 0) {
              AlertUtils.showToast('Failed', context);

              // advertisementList = homeScreenResponse.advertisementList;
              //   notifyListeners();
            } else if (adsGetResponse.success == 3) {
              print("NEED TO LOGIN HERE......");
              kMoveToLogin(context);
            }else if (adsGetResponse.success == 1) {
              pagecontents = adsGetResponse.pagecontents;
              notifyListeners();
            }
            // }else {
            //   AlertUtils.showToast(homeScreenResponse.message, context);
            // }

          } else {
            AlertUtils.showToast("Failed", context);
          }
        });
      }
    });
  }

  addMoney(BuildContext context)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().addMoneyToAccount().then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200) {
            AdsGetResponse adsGetResponse = AdsGetResponse.fromJson(response.data);

            if (adsGetResponse.success == 0) {
              AlertUtils.showToast('Failed', context);

              // advertisementList = homeScreenResponse.advertisementList;
              //   notifyListeners();
            } else if (adsGetResponse.success == 3) {
              print("NEED TO LOGIN HERE......");
              kMoveToLogin(context);
            }else if (adsGetResponse.success == 1) {
              notifyListeners();
            }
            // }else {
            //   AlertUtils.showToast(homeScreenResponse.message, context);
            // }

          } else {
            AlertUtils.showToast("Failed", context);
          }
        });
      }
    });
  }

  submitTransaction(BuildContext context,String addId,String transactionId)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().submitPayment(addId,transactionId).then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200) {
            PaymentSuccessResponse paymentSuccessResponse = PaymentSuccessResponse.fromJson(response.data);
            nextPagePushReplacement(context, UploadSuccess());
            if (paymentSuccessResponse.success == 1) {

              AlertUtils.showToast(
                  "Successfully updated", context);
              nextPagePushReplacement(context, UploadSuccess());
              // getAddressList(context);
              // Navigator.of(context).pop();
            } else if (paymentSuccessResponse.success == 3) {
              kMoveToLogin(context);
            } else {
              AlertUtils.showToast(paymentSuccessResponse.message, context);
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