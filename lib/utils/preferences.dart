import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:freezlotto/helper/api_params.dart';
import 'package:freezlotto/network/response/register_response.dart';
import 'package:freezlotto/network/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences{
  static Future<bool> getBool(PrefKey prefKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool(prefKey.key);
    if (status != null) {
      return status;
    } else {
      return false;
    }
  }
  static Future<bool> saveBool(PrefKey prefKey, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(prefKey.key, value);
  }
  static Future<bool> save(PrefKey prefKey, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(prefKey.key, value);
  }
  static Future<String> get(PrefKey prefKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(prefKey.key);
  }
  static Future<bool> clearPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(PrefKey.loginStatus.key, false);
    prefs.remove(PrefKey.phone.key);
    prefs.remove(PrefKey.name.key);
    prefs.remove(PrefKey.customerID.key);
    return true;
  }

}
enum PrefKey {
  loginStatus,
  phone,
  name,
  customerID
}
extension PrefKeysToString on PrefKey {
  String get key {
    return this.toString().split('.').last;
  }
}

// class Preferences{
//   Future saveUserToken(String usertoken) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //debugPrint('save user resp: $userResponse');
//     bool success = await prefs.setString(CUSTOMER_ID, usertoken);
//     return success;
//   }
//   Future saveLoginResponse(String userResponse) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //debugPrint('save user resp: $userResponse');
//     bool success = await prefs.setString('login_response', userResponse);
//     return success;
//   }
//
//   Future<RegisterResponse> getLoginResponse() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String user =
//     prefs.getString('login_response') == null ? "" : prefs.getString('login_response');
//     if (user == null || user.trim().isEmpty) {
//       return null;
//     }
//     return RegisterResponse.fromJson(json.decode(user == null ? "" : user));
//   }
//
//   Future saveUserMobile(String mobile) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //debugPrint('save user resp: $userResponse');
//     bool success = await prefs.setString(USER_PHONE, mobile);
//     return success;
//   }
//   Future saveCustomerID(String customerId) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //debugPrint('save user resp: $userResponse');
//     bool success = await prefs.setString(CUSTOMER_ID, customerId);
//     return success;
//   }
//   Future saveUserName(String userName) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //debugPrint('save user resp: $userResponse');
//     bool success = await prefs.setString("shopname", userName);
//     return success;
//   }
//
//
//   Future saveUser(String userResponse) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     debugPrint('save user resp: $userResponse');
//     bool success = await prefs.setString('user', userResponse);
//     return success;
//   }
//
//   Future saveAdminPhone(String adminNo) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     debugPrint('save admin phone NO: $adminNo');
//     bool success = await prefs.setString('admin_phone_no', adminNo);
//     return success;
//   }
//
//   Future<String> getAdminPhone() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('mobile_number');
//   }
//   Future<String> getCustomerID() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//   }
//
//   Future<UserData> getUser() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String user =
//     prefs.getString('user') == null ? "" : prefs.getString('user');
//     if (user == null || user.trim().isEmpty) {
//       return null;
//     }
//     return UserData.fromJson(json.decode(user == null ? "" : user));
//   }
// }