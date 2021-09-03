import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_page_screen.dart';
import 'package:freezlotto/screens/profile_screen.dart';
import 'package:freezlotto/screens/switch_to_admin_screen.dart';

import 'newsfeed_screen.dart';

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
                nextPagePush(context, ProfileScreen());
                },
                child: getContent('assets/images/profile.png', 'Profile')),
            InkWell(
                onTap: () {
                  nextPagePush(context, SwitchToAdminScreen());
                },
                child: getContent('assets/images/app.png', 'Switch to admin app')),
            getContent('assets/images/share_white.png', 'Share'),
            getContent('assets/images/about.png', 'About us & ads'),
            getContent('assets/images/terms.png', 'Terms and conditions'),
            getContent('assets/images/exit.png', 'Exit'),
          ],
        ),
      ),
    );
  }

  Widget getContent(
    String assetImage,
    String title,
  ) {
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
}
