import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezlotto/helper/api_url_data.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/switch_to_admin_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:freezlotto/blocs/home_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'home_screen.dart';
import 'package:freezlotto/utils/dynamic_link_service.dart';

final TextStyle style = TextStyle(
    color: white,
    fontWeight: FontWeight.w700,
    fontFamily: SEMI_BOLD_FONT,
    fontSize: 14,
    letterSpacing: 0.8);
final TextStyle style2 = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: SEMI_BOLD_FONT,
    fontSize: 14,
    letterSpacing: 0.8);

class HomePageScreen extends StatefulWidget {
  @override
  _NewsFeedScreenState createState() => new _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<HomePageScreen> {
  DateTime currentBackPressTime;
  Future<void> _initializeVideoPlayerFuture;
  String videoUrl = "";
  String videoPath = " ";

  @override
  void initState() {
    super.initState();

  }

  // @override
  // void dispose() {
  //
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    Provider.of<HomeBloc>(context, listen: false).getHomeData(context);
    Provider.of<HomeBloc>(context, listen: false).getAdsContentsData(context);
    return Scaffold(
      backgroundColor: white,
      floatingActionButton: Consumer<HomeBloc>(
        builder: (context, homeBloc, child) => Container(
          width: 75,height: 75,
          margin: EdgeInsets.only(right: 15,bottom: 60),
          child: FloatingActionButton(
            onPressed: () {
              homeBloc.commission_amount !=
                  "0"
                  ? homeBloc.addMoney(context)
                  : Container();
              nextPagePushReplacement(
                  context,
                  HomeScreen(
                    tabnumber: 2,
                  ));
            },
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.center,
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Text(
                  homeBloc.referal_count,
                  style: TextStyle(
                      color:
                      flottingTextColor,
                      fontFamily: MEDIUM_FONT,
                      fontWeight:
                      FontWeight.w400,
                      fontSize: 22),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(
                      bottom: 5),
                  child: Image.asset(
                    'assets/images/Vector.png',
                    width: 30,
                    height: 20,
                  ),
                ),
              ],
            ),
            mini: false,
            backgroundColor:
            homeBloc.commission_amount ==
                "0"
                ? flottingButtonColor
                : flottingRedTextColor,
          ),
        )),
      body:
      WillPopScope(
          onWillPop: onWillPop,
          child: Consumer<HomeBloc>(
            builder: (context, homeBloc, child) => ModalProgressHUD(
                inAsyncCall: homeBloc.isLoading,
                child: homePageImage(homeBloc)),
          )),
    );
  }

  Widget homePageImage(HomeBloc homeBloc) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(bottom: 65),
              height: MediaQuery.of(context).size.height / 2.3,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/bg.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                  itemCount: homeBloc.advertisementList.length,
                  // itemCount: homeBloc.advertisementList.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    WebView.platform = SurfaceAndroidWebView();
                        videoPath = '${'https://freezelotto.alisonsdemo.online/videoplay/'}${homeBloc.advertisementList[index].id}';
                    return Container(
                        margin: EdgeInsets.only(bottom: 65),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 230,
                        child: homeBloc.advertisementList[index].fileType ==
                                "image"
                            ? Container(
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 50,
                                          top: 40,
                                          left: 30,
                                          right: 30),
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(31)),
                                        // image: DecorationImage(
                                        //  image: AssetImage('assets/images/bg_dummy.png'),
                                        //     fit: BoxFit.cover),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(31)),
                                        child: FadeInImage.assetNetwork(
                                          fit: BoxFit.fitHeight,
                                          placeholder: 'assets/images/logo.png',
                                          image:
                                              '${APIClient.Ad_Asset_Location}${homeBloc.advertisementList[index].advertisement}',
                                        ),
                                      ),
                                    ),
//                                     Align(
//                                         alignment: Alignment.bottomRight,
//                                         child: Container(
//                                             margin: EdgeInsets.only(
//                                                 bottom: 30,
//                                                 top: 40,
//                                                 left: 30,
//                                                 right: 45),
//                                             width: 72,
//                                             height: 72,
//                                             child:
// ))
                                  ],
                                ),
                              )
                            : Container(
                                color: white,
                                child:
                                    SingleChildScrollView(
                                      physics: NeverScrollableScrollPhysics(),
                                      child: Container(

                                        // height: MediaQuery.of(context).size.height,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 300,
                                              child: Stack(
                                                children: <Widget>[
                                                  Card(
                                                    elevation:2,
                                                    shape:RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(23),
                                                   ),
                                                    margin: EdgeInsets.only(
                                                        left: 30,
                                                        right: 30,
                                                        top: 50),
                                                    // width:
                                                    //     MediaQuery.of(context).size.width,
                                                    // height: 300,
                                                    // decoration: BoxDecoration(
                                                    //     borderRadius:
                                                    //         BorderRadius.all(Radius.circular(23))),
                                                    child: ClipRRect(
                                                        borderRadius:BorderRadius.all(Radius.circular(23)),
                                                        child:
                                                            Container(
                                                                height: 300,
                                                                color: Colors.grey[300],
                                                                width:  MediaQuery.of(context).size.width,
                                                                child: WebView(
                                                                  initialUrl:videoPath,

                                                                ))

                                                        ),
                                                  ),
                                            //       Align(
                                            //         alignment: Alignment.bottomRight,
                                            //         child: Container(
                                            //           margin: EdgeInsets.only(bottom: 5,top: 40,left: 30,right: 45),
                                            //           height: 60,width: 60,
                                            //           child: FloatingActionButton(
                                            //   onPressed: () {
                                            //     homeBloc.commission_amount !=
                                            //         "0"
                                            //         ? homeBloc.addMoney(context)
                                            //         : Container();
                                            //     nextPagePushReplacement(
                                            //         context,
                                            //         HomeScreen(
                                            //           tabnumber: 2,
                                            //         ));
                                            //   },
                                            //   child: Column(
                                            //     crossAxisAlignment:
                                            //     CrossAxisAlignment.center,
                                            //     mainAxisAlignment:
                                            //     MainAxisAlignment.center,
                                            //     children: [
                                            //       Text(
                                            //         homeBloc.referal_count,
                                            //         style: TextStyle(
                                            //             color:
                                            //             flottingTextColor,
                                            //             fontFamily: MEDIUM_FONT,
                                            //             fontWeight:
                                            //             FontWeight.w400,
                                            //             fontSize: 22),
                                            //       ),
                                            //       Padding(
                                            //         padding:
                                            //         const EdgeInsets.only(
                                            //             bottom: 5),
                                            //         child: Image.asset(
                                            //           'assets/images/Vector.png',
                                            //           width: 30,
                                            //           height: 20,
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            //   mini: false,
                                            //   backgroundColor:
                                            //   homeBloc.commission_amount ==
                                            //       "0"
                                            //       ? flottingButtonColor
                                            //       : flottingRedTextColor,
                                            // ),
                                            //         ),
                                            //       )
                                                ], //<Widget>[]
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                nextPagePush(context,
                                                    SwitchToAdminScreen());
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 83,
                                                margin: EdgeInsets.only(
                                                    left: 30,
                                                    right: 30,
                                                    top: 30),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              15)),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/rectangle_10.png'),
                                                      fit: BoxFit.cover),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  'Click here to Upload Advertisement',
                                                  style: style,
                                                )),
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            getTermsBox(homeBloc.advertisementContents.conten1, 'assets/images/thumb.png'),
                                            getTermsBox(homeBloc.advertisementContents.conten2, 'assets/images/notess.png'),
                                            getTermsBox(homeBloc.advertisementContents.conten3, 'assets/images/close_round.png'),
                                            Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                bottom: 30,
                                                top: 40,
                                                left: 30,
                                                right: 45),
                                            width: 72,
                                            height: 72,
                                            child:
                                            FloatingActionButton(
                                              onPressed: () {
                                                homeBloc.commission_amount !=
                                                    "0"
                                                    ? homeBloc.addMoney(context)
                                                    : Container();
                                                nextPagePushReplacement(
                                                    context,
                                                    HomeScreen(
                                                      tabnumber: 2,
                                                    ));
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    homeBloc.referal_count,
                                                    style: TextStyle(
                                                        color:
                                                        flottingTextColor,
                                                        fontFamily: MEDIUM_FONT,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        fontSize: 22),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        bottom: 5),
                                                    child: Image.asset(
                                                      'assets/images/Vector.png',
                                                      width: 30,
                                                      height: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              mini: false,
                                              backgroundColor:
                                              homeBloc.commission_amount ==
                                                  "0"
                                                  ? flottingButtonColor
                                                  : flottingRedTextColor,
                                            )))

                                  ],
                                ),
                              ))));
                  })),
        
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: (){
                nextPagePushReplacement(context, MainScreen());
              },
              child: Container(
                height: 73,
                width: MediaQuery.of(context).size.width,
                decoration: buttongradient,
                child: Center(
                    child: Text(
                  'GIFT BOARD',
                  style: style,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // 'assets/images/thumb.png'
Widget getTermsBox(String content,String asset){
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: 67,
      margin: EdgeInsets.only(
          left: 30,
          right: 30,
          bottom: 24),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.all(
            Radius.circular(10)),
        color: Color(0xFFB1B1B1),
        image: DecorationImage(
            image: AssetImage(
              'assets/images/dotted.png',
            ),
            fit: BoxFit.fill),
      ),
      child: Center(
          child: Container(
              width: MediaQuery.of(
                  context)
                  .size
                  .width -
                  61.5,
              height: 65.5,
              decoration:
              BoxDecoration(
                borderRadius:
                BorderRadius.all(
                    Radius
                        .circular(
                        10)),
                color: white,
              ),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets
                          .only(
                          left:
                          26),
                      width: 30,
                      height: 30,
                      child:
                      Image.asset(
                        asset,
                        color:
                        iconColor,
                        fit: BoxFit
                            .fill,
                      )),
                  Container(
                      margin: EdgeInsets
                          .only(
                          left:
                          14),
                      width: MediaQuery.of(
                          context)
                          .size
                          .width -
                          140,
                      child: Text(
                       content,
                        // 'Chance to won Rs 1,00,000 per week for top like "NEWSFEED" post.',
                        style: style2,
                      )),
                ],
              ))),
    );
}
  void updateUI() {
    setState(() {
      //You can also make changes to your state here.
    });
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Press Back Button again to exit');
      return Future.value(false);
    }
    return Future.value(true);
  }

  Widget enableDataHome() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Text(
                    'OOPS!  NO INTERNET',
                    style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Please check your network connection',
                    style: TextStyle(color: textColor, fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 40, top: 5, right: 40),
                child: FlatButton(
                  onPressed: updateUI,
                  color: textColor,
                  child: Text(
                    'Try Again',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      );
}
