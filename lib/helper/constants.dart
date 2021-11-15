import 'dart:async';
import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_page_screen.dart';
import 'package:freezlotto/screens/home_screen.dart';
import 'package:freezlotto/screens/newsfeed_screen.dart';
import 'package:freezlotto/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SUCCESS_MESSAGE = "You will be contacted by us very soon.";
const APP_TAG = "FREEEZLOTTO";

// Api related
// const BASE_URL = "https://freezelotto.alisonsdemo.online/api/";


//Color Related
String rules_one = 'Chance to won Rs 1,00,000 per week for top like "NEWSFEED" post.';
String rules_two = 'Only funny and happy videos within 10 minutes will be considered.';
String rules_three = 'Accounts that post sex and hate contents will be banned.';
const Color primaryTextColor = const Color(0xFF929292);
const Color BoldTextColor = const Color(0xFF474747);
const Color BoldTextColor2 = const Color(0xFF575757);
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
const Color settingTitletextColor = const Color(0xFF606060);
const Color dropdowntextColor = const Color(0xFF656565);
const Color forwardIconColor = const Color(0xFF35479D);
const Color dateColor = const Color(0xFFADADAD);
const Color admin_subtitle = const Color(0xFF757575);
const Color bubbleColor = const Color(0xFFC4C4C4);
const Color dropdowndividerColor = const Color(0xFFE5E5E5);
const Color profileiconColor = const Color(0xFFAB1616);
final TextStyle style2 = TextStyle(fontWeight: FontWeight.w400,fontFamily: SEMI_BOLD_FONT,fontSize: 12,letterSpacing: 0.8);
final TextStyle appBarTitle = TextStyle(fontWeight: FontWeight.w500,fontFamily: SEMI_BOLD_FONT,fontSize: 21,letterSpacing: 0.8,color: white);
int homeScrolPosition=0;
 Timer timerHome =null;
Future<void> share(dynamic link, String title) async{
  await FlutterShare.share(
      title: title,
      text: title,
      linkUrl: link,
      chooserTitle: 'chooser title'
  );
}
//Box Decorations Related

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
BoxDecoration iconGradient = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(6))   ,
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
  stops: [0.1, 0.5, 0.9],
       colors: [
          Color(0xFF1FA2FF),
          Color(0xFF12D8FA),
          Color(0xFFA6FFE6),
   ]
)
);
BoxDecoration redBox = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(6))   ,
      color: red

);
BoxDecoration bggradient= BoxDecoration(
  shape: BoxShape.circle,
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
  // borderRadius: BorderRadius.only(topLeft: Radius.circular(-19),
  //     topRight: Radius.circular(50.78),
  //     bottomRight:Radius.circular(99),
  //     bottomLeft: Radius.circular(90)
  // ),
);
BoxDecoration couponOuter= BoxDecoration(
  gradient:  LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    // stops: [0.1, 0.5, 0.9],
    colors: [
      Color(0xFFFFB347),
      Color(0xFFFFCC33),
    ],
  ),
  borderRadius: BorderRadius.all(Radius.circular(10)),
);
BoxDecoration couponInner=
BoxDecoration(
  gradient:  LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    // stops: [0.1, 0.5, 0.9],
    colors: [
      Color(0xFFFFCC33),
      Color(0xFFFFB347),
    ],
  ),
  borderRadius: BorderRadius.all(Radius.circular(10)),
);
BoxDecoration couponInnerWhite= BoxDecoration(
  color: white,
  borderRadius: BorderRadius.all(Radius.circular(10)),
);
BoxDecoration bubble= BoxDecoration(
  shape: BoxShape.circle,
  color:bubbleColor
  // borderRadius: BorderRadius.only(topLeft: Radius.circular(-19),
  //     topRight: Radius.circular(50.78),
  //     bottomRight:Radius.circular(99),
  //     bottomLeft: Radius.circular(90)
  // ),
);

//Widgets Related

Widget getBubble(){
  return Container(
    margin: EdgeInsets.only(top: 8),
    height: 8,width: 8,
    decoration: bubble,
  );
}
Widget getAppBar(BuildContext context,String title,Widget body){
  return Scaffold(

    appBar: new PreferredSize(

      child:new Container(

      padding: new EdgeInsets.only(
      top: MediaQuery.of(context).padding.top
  ),
  decoration: new BoxDecoration(
  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),bottomRight:Radius.circular(60) ),
  image: DecorationImage(
  image: AssetImage('assets/images/rectangle_33.png'),
  fit: BoxFit.cover),
  ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap:(){
                 Navigator.pop(context);

      }         ,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Image.asset('assets/images/back_ios.png',width: 14,height: 23,),
              ),
            )      ,
            Center(child: Text(title,style: appBarTitle,)),
            Container(padding: EdgeInsets.only(right: 30),)
          ],
        ),
      ),

      preferredSize: new Size(
        MediaQuery.of(context).size.width,
       80.0
    ),
    ),
    body: body,
    backgroundColor: white,
  );
}

final GlobalKey<ScaffoldState> drawerScaffoldKey =new GlobalKey<ScaffoldState>();

Widget getProfileTabController(BuildContext context,Widget page,int number,int tabCount,double top,double width){
  return DefaultTabController(
    length: tabCount,
    initialIndex: number,
    child: Scaffold(
      appBar: new PreferredSize(
        child: new
        Container(
          padding: new EdgeInsets.only(
              top: top
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap:(){
                      Navigator.pop(context);

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Image.asset('assets/images/back_ios.png',width: 14,height: 23,),
                    ),
                  ),
                  Text('PROFILE',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: SEMI_BOLD_FONT,letterSpacing: 2),),
                  Container(padding: EdgeInsets.only(right: 30),)
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child:
                  TabBar(
                    unselectedLabelColor: white,
                    isScrollable: false,
                    labelColor: Colors.black,
                    labelStyle: style2,
                    indicatorColor: Colors.transparent,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: white),
                    tabs: [
                      Container(
                        width: width,
                        decoration:BoxDecoration(
                          border: Border.all(color: white),
                          borderRadius: BorderRadius.all(Radius.circular(5)),

                        ),
                        child: Tab(
                          text: "Advertisement",
                        ),
                      ),
                      Container(
                        width: width,
                        decoration:BoxDecoration(
                            border: Border.all(color: white),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Tab(
                          text: "Newsfeed",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18,)
            ],
          ),
        ),
        preferredSize: new Size(
           width,
            130.0
        ),
      ),
      backgroundColor: white,
      body: page,

    ),
  );
}

Widget getTabController(Widget page,int number,int tabCount,double top,double width){
  return DefaultTabController(
    length: tabCount,

    initialIndex: number,
    child: Scaffold(
      appBar: new PreferredSize(
        child: new Container(
          padding: new EdgeInsets.only(
              top: top
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
                  child:
                  TabBar(
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
           width,
            130.0
        ),
      ),
      backgroundColor: white,
      body: page,

    ),
  );
}

//Next Page  Related

void nextPagePush(BuildContext context,Widget nextPage){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => nextPage),
  );
}
void nextPagePushReplacement(BuildContext context,Widget nextPage){
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => nextPage),
  );
}

//Shared preference related

Future<String> getAdminPhone() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('mobile_number');
}

Widget progressBar = InkWell(
  child: SafeArea(
    child: Center(
      child: SizedBox(
        child: CircularProgressIndicator(),
        width: 30,
        height: 30,
      ),
    ),
  ),
);
Widget errorScreen(String errorTitle) => Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        Icons.error_outline,
        color: Colors.red,
        size: 60,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(errorTitle),
      )
    ],
  ),
);
kMoveToLogin(BuildContext context) {
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => RegisterScreen()));
}


