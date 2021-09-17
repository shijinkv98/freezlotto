import 'package:flutter/cupertino.dart';
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