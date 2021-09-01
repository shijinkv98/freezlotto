import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_page_screen.dart';
import 'package:freezlotto/screens/home_screen.dart';
import 'package:freezlotto/screens/newsfeed_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SUCCESS_MESSAGE = "You will be contacted by us very soon.";
const APP_TAG = "DRIVER_APP";

// Api related
// const BASE_URL = "https://2ccart.webdemos.cf/newdemo/api/api_driver/";


//Color Related

const Color primaryTextColor = const Color(0xFF929292);
const Color BoldTextColor = const Color(0xFF474747);
const Color HeadTextColor = const Color(0xFF3F3F3F);
const Color SubHeadTextColor = const Color(0xFF929292);
const Color white = const Color(0xFFFFFFFF);
const Color red = const Color(0xFFFF0000);
const Color background = const Color(0xFFE5E5E5);
const Color boxLoginColor = const Color(0xFFEFEFEF);
const Color dividerColor = const Color(0xFF000000);
const Color flottingButtonColor = const Color(0xFF698aff);
const Color flottingTextColor = const Color(0xFFFFFEFE);
const Color flottingRedTextColor = const Color(0xFFFA5252);
const Color iconColor = const Color(0xFF868686);
const Color textColor = const Color(0xFF484848);
final TextStyle style2 = TextStyle(fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 12,letterSpacing: 0.8);

BoxDecoration buttongradient= BoxDecoration(
  gradient:  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.1, 0.5, 0.9],
    colors: [
      Color(0xFF1FA2FF),
      Color(0xFF12D8FA),
      Color(0xFFA6FFE6),
    ],
  ),
  borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight:Radius.circular(16) ),

);
BoxDecoration bggradient= BoxDecoration(
  gradient:  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.1, 0.5, 0.9],
    colors: [
      Color(0xFF1FA2FF),
      Color(0xFF12D8FA),
      Color(0xFFA6FFE6),
    ],
  ),
  borderRadius: BorderRadius.only(topLeft: Radius.circular(-19),
      topRight: Radius.circular(50.78),
      bottomRight:Radius.circular(99),
      bottomLeft: Radius.circular(90)
  ),
);

Widget getTabController(BuildContext context,Widget page,int number){
  return DefaultTabController(
    length: 3,
    initialIndex: number,
    child: Scaffold(
      appBar: new PreferredSize(
        child: new Container(
          padding: new EdgeInsets.only(
              top: MediaQuery.of(context).padding.top
          ),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),bottomRight:Radius.circular(60) ),
            image: DecorationImage(
                image: AssetImage('assets/images/rectangle_33.png'),
                fit: BoxFit.cover),
          ),

          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text('FREEZLOTTO',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: SEMI_BOLD_FONT,letterSpacing: 2),),
              SizedBox(height: 20),
              Container(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TabBar(
                    unselectedLabelColor: white,
                    isScrollable: false,
                    labelColor: Colors.black,
                    labelStyle: style2,

                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: white),
                    tabs: [

                      Tab(
                          child: Container(
                            height: 40,
                            decoration:BoxDecoration(
                              border: Border.all(color: white),
                              borderRadius: BorderRadius.all(Radius.circular(5)),

                            ),
                            child: Center(child: Text('Home',)),)),
                      Tab(child: Container(
                        height: 40,
                        decoration:BoxDecoration(
                          border: Border.all(color: white),
                          borderRadius: BorderRadius.all(Radius.circular(5)),

                        ),child: Center(child: Text('Newsfeed',)),)),
                      Tab(child: Container(
                        height: 40,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: white),
                        ),child: Center(child: Text('Gallery',)),)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18,)
            ],
          ),
        ),
        preferredSize: new Size(
            MediaQuery.of(context).size.width,
            130.0
        ),
      ),
      backgroundColor: white,
      body: page,

    ),
  );
}
