import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io' show Platform;


final TextStyle style = TextStyle(color: BoldTextColor2,fontWeight: FontWeight.w600,fontFamily: SEMI_BOLD_FONT,fontSize: 19,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(color: textColor,fontWeight: FontWeight.w400,fontFamily: MEDIUM_FONT,fontSize: 14,letterSpacing: 0.8);
class AboutUscreen extends StatefulWidget{

  @override
  _AboutUscreenState createState() => new _AboutUscreenState();
  }
class _AboutUscreenState extends State<AboutUscreen> {

  @override
  void initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView();

  }


  @override
  Widget build(BuildContext context) {
    bool isAndroid = Theme.of(context).platform == TargetPlatform.android;
    return getAppBar(context, "About us",getBody());
  }
  Widget getBody(){
    return WebView(
      initialUrl: "https://www.google.com",
    );

}

}
