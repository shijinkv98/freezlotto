import 'dart:io';
import 'dart:math';
import 'package:connectivity/connectivity.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import 'dialog_utils.dart';

class AppUtils {
  static bool isValidEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,3}))$';
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(email))
      return true;
    else
      return false;
  }
  // static Future<String> buildDynamicLink() async {
  //   String url = "https://freezlotto.page.link";
  //   final DynamicLinkParameters parameters = DynamicLinkParameters(
  //     uriPrefix: url,
  //     link: Uri.parse('$url/post/56'),
  //     androidParameters: AndroidParameters(
  //       packageName: "com.freezlotto.application",
  //       minimumVersion: 0,
  //     ),
  //     iosParameters: IosParameters(
  //       bundleId: "freezlotto-49be1",
  //       minimumVersion: '0',
  //     ),
  //     socialMetaTagParameters: SocialMetaTagParameters(
  //         description: "Check out the given link",
  //         imageUrl:
  //         Uri.parse("https://flutter.dev/images/flutter-logo-sharing.png"),
  //         title: "Freezlotto"),
  //   );
  //   final ShortDynamicLink dynamicUrl = await parameters.buildShortLink();
  //   return dynamicUrl.shortUrl.toString();
  // }
  static String generateRandomString(int length) {
    var rand = new Random();
    var codeUnits = new List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });
    String randomKey = new String.fromCharCodes(codeUnits);
    return randomKey;
  }

  static Future<bool> isConnectedToInternet(BuildContext context) async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      return true;
    } else {
      DialogUtils.showNoNetworkDialog(context);
      return false;
    }
  }

  static DateTime getDateFromString(String dateString) {
    try {
      DateTime dateTime = DateTime.parse(dateString);
      return dateTime;
    } catch (e) {
      print(e);
      return DateTime.now();
    }
  }

  // static Future<File> selectImage(ImageSource imageSource) async {
  //   var pickedFile = await FilePicker.platform.pickFiles(type: FileType.image);
  //   if (pickedFile != null) {
  //     File file = File(pickedFile.files.single.path);
  //     print(file);
  //     if (file != null) {
  //       var result = file;
  //       return result;
  //     } else {
  //       return null;
  //     }
  //   } else {
  //     return null;
  //   }
  // }

  // static Future<File> selectFile(ImageSource imageSource) async {
  //   var pickedFile = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['jpg', 'png', 'pdf'],
  //       allowMultiple: false);
  //   if (pickedFile != null) {
  //     File file = File(pickedFile.files.single.path);
  //     print(file);
  //     if (file != null) {
  //       var result = file;
  //       return result;
  //     } else {
  //       return null;
  //     }
  //   } else {
  //     return null;
  //   }
  // }

  // static void launchMapwithlocation({String lat, String lang}) {
  //   var latitude = double.parse(lat);
  //   var longitude = double.parse(lang);
  //   MapsLauncher.launchCoordinates(latitude, longitude);
  // }
}
