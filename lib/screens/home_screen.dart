import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_screen_red.dart';
import 'package:freezlotto/screens/newsfeed_screen.dart';

import 'gallery_screen.dart';
import 'home_page_screen.dart';
import 'home_screen_video.dart';

final TextStyle style = TextStyle(color: white,fontWeight: FontWeight.w700,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);

class HomeScreen extends StatefulWidget{

  @override
  _HomeScreenState createState() => new _HomeScreenState();
  }
class _HomeScreenState extends State<HomeScreen>{

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return getTabController(context,getHOMEpage(),0);
  }
  Widget getHOMEpage() {
    return TabBarView(
      children: [
        HomePageScreen(),
        NewsFeedScreen(),
        GalleryScreen(),
      ],
    );

  }



}