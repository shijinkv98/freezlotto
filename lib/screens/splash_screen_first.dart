
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/main.dart';
import 'package:freezlotto/screens/home_screen.dart';
import 'package:freezlotto/screens/register_screen.dart';
import 'package:freezlotto/screens/splash_screen.dart';
import 'package:freezlotto/screens/splash_screen_second.dart';
import 'package:freezlotto/utils/dynamic_link_service.dart';
import 'package:freezlotto/utils/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreenFirst extends StatefulWidget {
  @override
  _SplashScreenFirstState createState() => new _SplashScreenFirstState();
}

class _SplashScreenFirstState extends State<SplashScreenFirst> with WidgetsBindingObserver{
  final DynamicLinkService _dynamicLinkService = DynamicLinkService();
  Timer _timerLink;
  String stringValue;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    // _dynamicLinkService.retrieveDynamicLink(context);
    super.initState();
    getStringValuesSF();
    new
    Future.delayed(
        const Duration(seconds: 2),(){
          Preferences.get(PrefKey.phone).then((userPhone) {
            if(userPhone == null){
              // _dynamicLinkService.retrieveDynamicLink(context);
              nextPagePushReplacement(context, SplashScreen());
            }
            else{
              // nextPagePushReplacement(context,
              //     HomeScreen(tabnumber: 0)
              // );
              // _dynamicLinkService.retrieveDynamicLink(context);
              nextPagePushReplacement(context,
                  SplashScreenSecond(customerMobile:userPhone)
              );
            }
          });
    }
    );
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _timerLink = new Timer(
        const Duration(milliseconds: 1000),
            () {
          _dynamicLinkService.retrieveDynamicLink(context);
        },
      );
    }
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (_timerLink != null) {
      _timerLink.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      // use Scaffold also in order to provide material app widgets
      body:Container(),
    );
  }
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    stringValue = prefs.getString(PrefKey.phone.toString());
    return stringValue;
  }
}
