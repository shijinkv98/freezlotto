import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/blocs/gallery_bloc.dart';
import 'package:freezlotto/blocs/home_bloc.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_page_screen.dart';
import 'package:freezlotto/screens/profile_ads_screen.dart';
import 'package:freezlotto/screens/profile_newsfeed_screen.dart';
import 'package:provider/provider.dart';

import 'newsfeed_screen.dart';
import 'teat_page.dart';

final TextStyle style = TextStyle(color: white,fontWeight: FontWeight.w700,fontFamily: SEMI_BOLD_FONT,fontSize: 14,letterSpacing: 0.8);
final TextStyle style2 = TextStyle(color:textColor,fontWeight: FontWeight.w400,fontFamily: MEDIUM_FONT,fontSize:14,letterSpacing: 0.8);
final TextStyle style5 = TextStyle(color:white,fontWeight: FontWeight.w400,fontFamily: MEDIUM_FONT,fontSize:14,letterSpacing: 0.8);
final TextStyle style4= TextStyle(color:dateColor,fontWeight: FontWeight.w400,fontFamily: MEDIUM_FONT,fontSize:14,letterSpacing: 0.8);
final TextStyle style3 = TextStyle(color:textColor,fontWeight: FontWeight.w600,fontFamily: SEMI_BOLD_FONT,fontSize: 19,letterSpacing: 0.8);
String _Link;
class ProfileScreen extends StatefulWidget{
int tabnumer;
  @override
  _ProfileScreenState createState() => new _ProfileScreenState(tabnumer:this.tabnumer);
  ProfileScreen({this.tabnumer});
  }
class _ProfileScreenState extends State<ProfileScreen> {
  int tabnumer;
_ProfileScreenState({this.tabnumer});
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Provider.of<GalleryBloc>(context, listen: false).getProfileAdsData(context);
    return getProfileTabController(context,getBody(),tabnumer,2,MediaQuery.of(context).padding.top,MediaQuery.of(context).size.width);
  }
  Widget getBody(){
    return NotificationListener(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollEndNotification) _onTabChanged();
        return false;
      },
      child: TabBarView(
        children: [
          Center(
              child:
              ProfileAdsScreen()
          ),
          Center(
            child: ProfileNewsFeedScreen()
          )
        ],
      ),
    );
}
  void _onTabChanged() {
    // if (_tabController.index!=currentPosition) {
    //   Fluttertoast.showToast(msg: 'Press Back Button again to exit');
    //   currentPosition=_tabController.index;
    // }

  }
  Widget getContentVideo(){
    return getListVideo();
  }
  Widget getListVideo() {
    return
      ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _listVideo();
        });
  }
  Widget _listVideo() {
    return Container(
      child: Column(
        children: [
          Container(
            height: 221,
            child: Stack(
              children: <Widget>[
                Container(

                  width: MediaQuery.of(context).size.width,
                  height: 221,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/probg.png'),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.all(Radius.circular(23)),
                    color: white
                )),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                          image: DecorationImage(
                              image: AssetImage('assets/images/play.png'),
                              fit: BoxFit.cover),
                        ))),
              ], //<Widget>[]
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/like.png',
                          ),width: 15,height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:5),
                          child: Text(
                            '120 Like',
                            style: style2,
                          ),
                        )
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/link.png',
                          ),width: 15,height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:5),
                          child: Text(
                            'Copy Link',
                            style: style2,
                          ),
                        )
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/notes.png'
                          ),width: 15,height: 14,
                        ),
                        Container(
                          height: 60,
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              '07/05/2021: 3.30PM',
                              style: style4,
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getContentAds(){
    return getListAds();
  }
  Widget getListAds() {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return       Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/mask_group.png'),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.all(Radius.circular(23)),
                      color: white

                  ),
                  height: 221,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage(
                                  'assets/images/eye.png',
                                ),width: 15,height: 14,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:5),
                                child: Text(
                                  'View',
                                  style: style2,
                                ),
                              )
                            ],
                          )),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage(
                                  'assets/images/close_circle.png',
                                ),width: 15,height: 14,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:5),
                                child: Text(
                                  'Cancel',
                                  style: style2,
                                ),
                              )
                            ],
                          )),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.1, 0.5, 0.9],
                              colors: [
                                Color(0xFF1FA2FF),
                                Color(0xFF12D8FA),
                                Color(0xFFA6FFE6),
                              ],
                            ),
                            color: white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:15,right: 6),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/tick.png'
                                  ),width: 12,height: 14,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:20,top: 4,bottom: 4),
                                child: Text(
                                  'Active',
                                  style: style5,
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }


  Widget getContentAdsRepeat(){
    return getListAdsRepeat();
  }
  Widget getListAdsRepeat() {
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _listAdsRepeat();
        });
  }
  Widget _listAdsRepeat() {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/orange.png'),
                    fit: BoxFit.fill),
              borderRadius: BorderRadius.all(Radius.circular(23)),
              color: white
            ),
            width: MediaQuery.of(context).size.width,
            height: 221,
            // child: Image.asset(
            //   'assets/images/orange.png',
            //   fit: BoxFit.contain,
            // ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/eye.png',
                          ),width: 15,height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:5),
                          child: Text(
                            'View',
                            style: style2,
                          ),
                        )
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/close_circle.png',
                          ),width: 15,height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:5),
                          child: Text(
                            'Cancel',
                            style: style2,
                          ),
                        )
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.1, 0.5, 0.9],
                        colors: [
                          Color(0xFF1FA2FF),
                          Color(0xFF12D8FA),
                          Color(0xFFA6FFE6),
                        ],
                      ),
                      color: white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:15,right: 6),
                          child: Image(
                            image: AssetImage(
                              'assets/images/repeat.png'
                            ),width: 12,height: 14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:20,top: 4,bottom: 4),
                          child: Text(
                            'Repeat',
                            style: style5,
                          ),
                        )
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

 Widget getContentFeeds(){
    return getListFeeds();
  }
 Widget getListFeeds() {
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _listFeeds();
        });
  }
 Widget _listFeeds() {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/feedsbg.png'),
                    fit: BoxFit.fill),
              borderRadius: BorderRadius.all(Radius.circular(23)),
              color: white
            ),
            width: MediaQuery.of(context).size.width,
            height: 221,
            // child: Image.asset(
            //   'assets/images/orange.png',
            //   fit: BoxFit.contain,
            // ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/like.png',
                          ),width: 15,height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:5),
                          child: Text(
                            '120 Like',
                            style: style2,
                          ),
                        )
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/link.png',
                          ),width: 15,height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:5),
                          child: Text(
                            'Copy Link',
                            style: style2,
                          ),
                        )
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage(
                              'assets/images/notes.png'
                          ),width: 15,height: 14,
                        ),
                        Container(
                          height: 60,
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              '07/05/2021: 3.30PM',
                              style: style4,
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

}
