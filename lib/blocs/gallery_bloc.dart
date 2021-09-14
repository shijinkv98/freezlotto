import 'package:flutter/cupertino.dart';
import 'package:freezlotto/network/response/about_us_response.dart';
import 'package:freezlotto/network/response/home_response.dart';
import 'package:freezlotto/network/response/response.dart';
import 'package:freezlotto/network/response/terms_response.dart';
import 'package:freezlotto/utils/api_services.dart';
import 'package:freezlotto/utils/app_utils.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/utils/alert_utils.dart';

class GalleryBloc extends ChangeNotifier {
  bool isLoading = false;
  // AdvertisementList _advertisementList = new AdvertisementList();
  // AdvertisementList get homeData => _advertisementList;
  // set homeData(AdvertisementList data){
  //   _advertisementList = data;
  //   notifyListeners();
  // }
  List<TermsDetails> termsDetails = new List<TermsDetails>();
  List<AboutUsResponse> aboutDetails = new List<AboutUsResponse>();


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

        APIService().getAboutData().then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200){
            AboutUsResponse aboutScreenResponse =
            AboutUsResponse.fromJson(response.data);
            // advertisementList = termsScreenResponse.advertisementList;
            // notifyListeners();

            if (aboutScreenResponse.success == 0) {
              AlertUtils.showToast(aboutScreenResponse.message, context);

              aboutDetails = aboutScreenResponse.aboutDetails.cast<AboutUsResponse>();
              //   notifyListeners();
            } else if (aboutScreenResponse.success == 3) {
              print("NEED TO LOGIN HERE......");
              kMoveToLogin(context);
            }else if (aboutScreenResponse.success == 1) {
              aboutDetails = aboutScreenResponse.aboutDetails.cast<AboutUsResponse>();
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