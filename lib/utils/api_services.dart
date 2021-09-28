import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/screens/payment_details_screen.dart';
import 'package:freezlotto/screens/upload_successfull.dart';
import 'package:http/http.dart'as http;
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
      // CUS_ID: '1'
      CUS_ID: await Preferences.get(PrefKey.customerID)
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
      // CUS_ID: '1',
      NEWSFEED_ID: newsfeedId,
      LIKEABLE:'1',
      CUS_ID: await Preferences.get(PrefKey.customerID)
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
      // CUS_ID: '57',
      NEWSFEED: "$newsfeed",
      CUS_ID: await Preferences.get(PrefKey.customerID)
    };
    print("URL:::" + url + queryParams.toString());
    Response response = await dio.post(url,queryParameters: queryParams);
    print("RESPONSE:::" + response.data.toString());
    return response;
  }
  ///upload ads///
  Future<Response> uploadImage(BuildContext context,File file,String type,String duration,String category) async {
    String fileName = file.path.split('/').last;
    var url = APIClient.ADD;
    FormData formData = FormData.fromMap({
      ADD:await MultipartFile.fromFile(file.path, filename:fileName),
      FREE_OR_PAID:type,
      DURATION:duration,
      CATEGORY:category,
      CUS_ID: await Preferences.get(PrefKey.customerID)
    });
    print("URL:::" + url + formData.toString());
    Response response = await dio.post(url, data: formData);
    print("RESPONSE:::" + response.data.toString());

    // response.statusCode == 200 ? nextPagePushReplacement(context, type=="free"?UploadSuccess(): PaymentDetailsScreen()):Container();
    return response;
  }
  ///get ads ///
  Future<Response> getAdsData(String addId,String paid_amount) async {
    var url = APIClient.ADD_Get;
    var queryParams = {
      ADD_ID: addId,
      PAID_AMOUNT: paid_amount,
    };
    print("URL:::" + url + queryParams.toString());
    Response response = await dio.post(url,queryParameters: queryParams);
    print("RESPONSE:::" + response.data.toString());
    return response;
  }
  ///SUBMIT PAYMENT///
  Future<Response> submitPayment(String addId,String transactionId) async {
    var url = APIClient.PAYMENT;
    var queryParams = {
     ADD_ID: addId,
     TRANSACTION_ID: transactionId,
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
      // CUS_ID: '58',
      NEXT:'0',
      CUS_ID: await Preferences.get(PrefKey.customerID)
    };
    print("URL:::" + url + queryParams.toString());
    Response response = await dio.post(url,queryParameters: queryParams);
    print("RESPONSE:::" + response.data.toString());
    return response;
  }
///get Profile Newsfeed list///
  Future<Response> getProfileNewsFeedListData() async {
    var url = APIClient.PROFILE_NEWS_FEEDS_LIST;
    var queryParams = {
      CUS_ID: await Preferences.get(PrefKey.customerID)
    };
    print("URL:::" + url + queryParams.toString());
    Response response = await dio.post(url,queryParameters: queryParams);
    print("RESPONSE:::" + response.data.toString());
    return response;
  }
  ///get gallery list///
  Future<Response> getGalleryData() async {
    var url = APIClient.GALLERY;
    var queryParams = {
      CUS_ID: await Preferences.get(PrefKey.customerID)
    };
    print("URL:::" + url + queryParams.toString());
    Response response = await dio.post(url,queryParameters: queryParams);
    print("RESPONSE:::" + response.data.toString());
    return response;
  }

  Future<Response> getNextListData() async {
    var url = APIClient.NEWS_FEEDS_LIST;
    var queryParams = {
      // CUS_ID: '58',
      NEXT:'1',
      CUS_ID: await Preferences.get(PrefKey.customerID)
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