import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_screen_red.dart';
import 'package:freezlotto/screens/newsfeed_screen.dart';
import 'package:freezlotto/utils/dynamic_link_service.dart';
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
class _HomeScreenState extends State<HomeScreen>with WidgetsBindingObserver
// ,SingleTickerProviderStateMixin
{

  final DynamicLinkService _dynamicLinkService = DynamicLinkService();
  Timer _timerLink;
  String _customer_id;
  DateTime currentBackPressTime;
  int tabnumber;
   TabController _tabController;
  _HomeScreenState({this.tabnumber});
  @override
  void initState(){
    // _tabController = TabController(
    //   length: 3,
    //   initialIndex: 0, vsync: this,
    // );
    WidgetsBinding.instance.addObserver(this);
    // _dynamicLinkService.retrieveDynamicLink(context);
    // WidgetsBinding.instance.removeObserver(this);
    super.initState();
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

  @override deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {

    return getTabController(getHOMEpage(),tabnumber,3,MediaQuery.of(context).padding.top,MediaQuery.of(context).size.width);
  }
  Widget getHOMEpage() {
    return
      WillPopScope(
        onWillPop: () async => showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(title: Text('Are you sure you want to quit?'), actions: <Widget>[
                  RaisedButton(
                      child: Text('OK'),
                      onPressed: () => Navigator.of(context).pop(exit(0))),
                  RaisedButton(
                      child: Text('CANCEL'),
                      onPressed: () => Navigator.of(context).pop(false)),
                ])),
        child:
        NotificationListener(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollEndNotification) _onTabChanged();
            return false;
          },
          child: TabBarView(
            //controller: _tabController,
            physics: ScrollPhysics(),
            children: [
              HomePageScreen(),
              NewsFeedScreen(),
              GalleryScreen(),
            ],

          ),
        )
    );
  }
  int currentPosition=0;
  void _onTabChanged() {
    // if (_tabController.index!=currentPosition) {
    //   Fluttertoast.showToast(msg: 'Press Back Button again to exit');
    //   currentPosition=_tabController.index;
    // }

  }
}