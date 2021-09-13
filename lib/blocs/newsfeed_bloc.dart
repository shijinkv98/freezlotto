import 'package:flutter/cupertino.dart';
import 'package:freezlotto/network/response/home_response.dart';
import 'package:freezlotto/network/response/response.dart';
import 'package:freezlotto/utils/api_services.dart';
import 'package:freezlotto/utils/app_utils.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/utils/alert_utils.dart';

class NewsFeedBloc extends ChangeNotifier {
  bool isLoading = false;
  // AdvertisementList _advertisementList = new AdvertisementList();
  // AdvertisementList get homeData => _advertisementList;
  // set homeData(AdvertisementList data){
  //   _advertisementList = data;
  //   notifyListeners();
  // }
  List<AdvertisementList> advertisementList = new List<AdvertisementList>();

  getNewsFeedData(BuildContext context)  {
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
}