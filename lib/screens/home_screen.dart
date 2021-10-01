import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_screen_red.dart';
import 'package:freezlotto/screens/newsfeed_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'gallery_screen.dart';
import 'home_page_screen.dart';
import 'home_screen_video.dart';

final TextStyle style = TextStyle(color: white,fontWeight: FontWeight.w700,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);

class HomeScreen extends StatefulWidget{
  int tabnumber;
  @override
  _HomeScreenState createState() => new _HomeScreenState(tabnumber:this.tabnumber);
  HomeScreen({this.tabnumber});
  }
class _HomeScreenState extends State<HomeScreen>{
  String _customer_id;
  int tabnumber;
  _HomeScreenState({this.tabnumber});
  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return getTabController(getHOMEpage(),tabnumber,3,MediaQuery.of(context).padding.top,MediaQuery.of(context).size.width);
  }
  Widget getHOMEpage() {
    return TabBarView(
      physics: ScrollPhysics(),
      children: [
        HomePageScreen(),
        NewsFeedScreen(),
        GalleryScreen(),
      ],
    );

  }




}