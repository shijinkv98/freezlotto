import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/aboutus_screen.dart';
import 'package:freezlotto/screens/home_page_screen.dart';
import 'package:freezlotto/screens/profile_screen.dart';
import 'package:freezlotto/screens/switch_to_admin_screen.dart';
import 'package:freezlotto/screens/terms_conditions_screen.dart';
import 'package:freezlotto/utils/preferences.dart';
import 'register_screen.dart';

final TextStyle style = TextStyle(
    color: white,
    fontWeight: FontWeight.w700,
    fontFamily: SEMI_BOLD_FONT,
    fontSize: 14,
    letterSpacing: 0.8);
final TextStyle style2 = TextStyle(
    color: settingTitletextColor,
    fontWeight: FontWeight.w400,
    fontFamily: MEDIUM_FONT,
    fontSize: 20,
    letterSpacing: 0.8);
final TextStyle style3 = TextStyle(
    color: textColor,
    fontWeight: FontWeight.w600,
    fontFamily: SEMI_BOLD_FONT,
    fontSize: 19,
    letterSpacing: 0.8);
String _Link;

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => new _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getAppBar(context, "Settings", getBody());
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 65),
        child: Column(
          children: [
            InkWell(
                onTap: () {
                nextPagePush(context, ProfileScreen(tabnumer: 0,));
                },
                child: getContent('assets/images/profile.png', 'Profile')),
            InkWell(
                onTap: () {
                  nextPagePush(context, SwitchToAdminScreen());
                },
                child: getContent('assets/images/app.png', 'Switch to admin app')),
            InkWell(
                onTap: () {
                  share('${'Find Freezlotto in Playstore !'}\n${'https://play.google.com/store/apps/details?id=qa.xshop.vendor_app'}', '${'Find Freezlotto in App store !'}\n${'https://apps.apple.com/us/app/xshop-seller-application/id1552667815'}');
                },
                child: getContent('assets/images/share_white.png', 'Share')),
            InkWell(
                onTap: () {
                  nextPagePush(context, AboutUscreen());
                },
                child: getContent('assets/images/about.png', 'About us & ads')),
            InkWell(
                onTap: () {
                  nextPagePush(context, TermsConditionsScreen());
                },
                child: getContent('assets/images/terms.png', 'Terms and conditions')),
            InkWell(
                onTap: () {
                  return
                  showDialog(
                    context: context,
                    builder: (ctx) =>
                        AlertDialog(
                          content:  Builder(
                            builder: (context) {
                              // Get available height and width of the build area of this widget. Make a choice depending on the size.
                              double height = 150;
                              var width = MediaQuery.of(context).size.width;
                              return Container(
                                height: height,
                                width: width - 60,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Are you sure?",style: style3),
                                    SizedBox(height: 10),
                                    Text("Do you what to Logout!",style: style2,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap:(){
                                            Preferences.clearPreference();
                                            logout(context);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 5,top: 15),
                                            decoration: iconGradient,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                              child: Text("Yes , Logout",style: style,),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap:(){
                                            Navigator.of(ctx).pop();                                  },
                                          child: Container(
                                            margin: EdgeInsets.only(left: 5,top: 15),
                                            decoration: redBox,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                              child: Text("Cancel",style: style,),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                  );
                  // getAlertLogout(context);
                  // Navigator.pop(context);
                },
                child: getContent('assets/images/exit.png', 'Exit')),
          ],
        ),
      ),
    );
  }

  Widget getContent(String assetImage,String title,) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 35,
                        height: 35,
                        margin: EdgeInsets.only(right: 10),
                        decoration: iconGradient,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            assetImage,
                            width: 16,
                            height: 16,
                          ),
                        )),
                    Text(
                      title,
                      style: style2,
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: forwardIconColor,
                  size: 15,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Divider(
                color: Colors.black,
                height: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> logout(BuildContext context)
  async {

    nextPagePushReplacement(context, RegisterScreen());

  }
  // Widget getAlertLogout(BuildContext context){
  //   return  showDialog(
  //     builder: (context) => AlertDialog(
  //       title: Center(child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text('Logout ?', style:TextStyle(color: textColor,fontSize: 18,fontWeight: FontWeight.bold),),
  //           SizedBox(height: 10),
  //           Text('Are you sure you want to exit ?' , style:TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.normal),)
  //         ],
  //       )),
  //       // content: Center(child: Text('Are you sure you want to exit ?')),
  //       actions: <Widget>[
  //         FlatButton(
  //           onPressed: () {
  //             print("you choose no");
  //             Navigator.of(context).pop(false);
  //           },
  //           child: Text('No',style:TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.normal)),
  //         ),
  //         FlatButton(
  //           onPressed: () {
  //             Preferences.clearPreference();
  //             logout(context);
  //           },
  //           child: Text('Yes',style:TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.normal)),
  //         ),
  //       ],
  //     ), context: context,
  //   ) ??
  //       false;
  // }



}

