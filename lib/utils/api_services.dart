import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezlotto/helper/api_params.dart';
import 'package:freezlotto/helper/api_url_data.dart';
import 'package:freezlotto/utils/preferences.dart';

class APIService {
  static final APIService _singleton = new APIService._internal();
  String customerId;
  String phone;
  String name;
  factory APIService() {
    return _singleton;
  }

  APIService._internal() {
    _initilizeHeader();
  }

  Dio dio = new Dio();

  _initilizeHeader() {
    dio.options.headers["Content-Type"] = "application/json";
  }

  updateHeader(String authToken) async {
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers[CUSTOMER_ID] = authToken;
    customerId = await Preferences.get(PrefKey.customerID);
    phone = await Preferences.get(PrefKey.phone);
    name = await Preferences.get(PrefKey.name);
  }
   ///get home data//
  Future<Response> getHomeData() async {
    var url = APIClient.HOME;
    var queryParams = {
      CUS_ID: '1'
      // CUS_ID: await Preferences.get(PrefKey.customerID)
    };
    print("URL:::" + url + queryParams.toString());
    Response response = await dio.post(url,queryParameters: queryParams);
    print("RESPONSE:::" + response.data.toString());
    return response;
  }
  ///like update newsfeed list ///
  Future<Response> likeUpdate(String newsfeedId) async {
    var url = APIClient.NEWS_FEEDS_LIKE;
    var queryParams = {
      CUS_ID: '1',
      NEWSFEED_ID: newsfeedId,
      LIKEABLE:'1'

      // CUS_ID: await Preferences.get(PrefKey.customerID)
    };
    print("URL:::" + url + queryParams.toString());
    Response response = await dio.post(url,queryParameters: queryParams);
    print("RESPONSE:::" + response.data.toString());
    return response;
  }
   ///upload newsfeed///
  Future<Response> uploadNewsfeed(String newsfeed) async {
    var url = APIClient.FEEDS;
    var queryParams = {
      CUS_ID: '57',
      NEWSFEED: "$newsfeed",
      // CUS_ID: await Preferences.get(PrefKey.customerID)
    };
    print("URL:::" + url + queryParams.toString());
    Response response = await dio.post(url,queryParameters: queryParams);
    print("RESPONSE:::" + response.data.toString());
    return response;
  }
  ///upload ads///
  Future<Response> uploadAds(File add,String type,String duration,String category) async {
    var url = APIClient.ADD;
    var queryParams = {
      CUS_ID: '1',
      ADD: "$add",
      FREE_OR_PAID:"$type",
      DURATION:"$duration",
      CATEGORY:"$category"
      // CUS_ID: await Preferences.get(PrefKey.customerID)
    };
    print("URL:::" + url + queryParams.toString());
    Response response = await dio.post(url,queryParameters: queryParams);
    print("RESPONSE:::" + response.data.toString());
    return response;
  }
  ///get Newsfeed list///
  Future<Response> getNewsFeedListData() async {
    var url = APIClient.NEWS_FEEDS_LIST;
    var queryParams = {
      CUS_ID: '58',
      NEXT:'0'
      // CUS_ID: await Preferences.get(PrefKey.customerID)
    };
    print("URL:::" + url + queryParams.toString());
    Response response = await dio.post(url,queryParameters: queryParams);
    print("RESPONSE:::" + response.data.toString());
    return response;
  }

  Future<Response> getNextListData() async {
    var url = APIClient.NEWS_FEEDS_LIST;
    var queryParams = {
      CUS_ID: '58',
      NEXT:'1'
      // CUS_ID: await Preferences.get(PrefKey.customerID)
    };
    print("URL:::" + url + queryParams.toString());
    Response response = await dio.post(url,queryParameters: queryParams);
    print("RESPONSE:::" + response.data.toString());
    return response;
  }
  ///Signup user///
  Future<Response> signUpUser(String name,String phone,String ref,String phone_code,String re_phone_code) async {
    var url = APIClient.Register_URL;
    var queryParams = {
      USER_NAME:"$name",
      USER_PHONE:"$phone",
      REF_NUM:"$ref",
      PHONE_COUNTRY_CODE:"$phone_code",
      REFERAL_COUNTRY_CODE:"$re_phone_code",
    };
    print("URL:::" + url + queryParams.toString());
    Response response = await dio.post(url, queryParameters: queryParams);
    print("RESPONSE:::" + response.data.toString());
    return response;
  }

  ///get terms data///
  Future<Response> getTermsData() async {
    var url = APIClient.TERMS;
    print("URL:::" + url);
    Response response = await dio.get(url);
    print("RESPONSE:::" + response.data.toString());
    return response;
  }
 ///get ads contents data///
  Future<Response> getAdsContents() async {
    var url = APIClient.Ads_Contents;
    print("URL:::" + url);
    Response response = await dio.get(url);
    print("RESPONSE:::" + response.data.toString());
    return response;
  }


}