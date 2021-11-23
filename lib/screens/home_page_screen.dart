import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezlotto/helper/api_url_data.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/switch_to_admin_screen.dart';
import 'package:freezlotto/utils/preferences.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:freezlotto/blocs/home_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'home_screen.dart';

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
  String currDuration;
  int currPosition=0;
  String duration="";
  var cus_id = "";
  Timer timer;
  int scrollPosition=0;
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  AutoScrollController  _scrollController = AutoScrollController ();
  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {

    scrollPosition=0;
    if(timer!=null)
      timer.cancel();
    if(_scrollController.hasClients)
      _scrollController.animateTo(
          0, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    super.initState();

    Provider.of<HomeBloc>(context, listen: false).getHomeData(context);
    Provider.of<HomeBloc>(context, listen: false).getAdsContentsData(context);
    getUserInfo();
  }
  @override
  void dispose()
  {

    if(_scrollController.hasClients)
      _scrollController.animateTo(
          0, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    scrollPosition=0;
    if(timer!=null)
      timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    scrollPosition=0;
    return Scaffold(
      backgroundColor: white,
      floatingActionButton: Consumer<HomeBloc>(
          builder: (context, homeBloc, child) => Container(
            width: 75,
            height: 75,
            margin: EdgeInsets.only(right: 15, bottom: 60),
            child: FloatingActionButton(
              onPressed: () {
                homeBloc.commission_amount != "0"
                    ? homeBloc.addMoney(context)
                    : Container();
                nextPagePushReplacement(
                    context,
                    HomeScreen(
                      tabnumber: 2,
                    ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    homeBloc.referal_count,
                    style: TextStyle(
                        color: flottingTextColor,
                        fontFamily: MEDIUM_FONT,
                        fontWeight: FontWeight.w400,
                        fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'assets/images/Vector.png',
                      width: 30,
                      height: 20,
                    ),
                  ),
                ],
              ),
              mini: false,
              backgroundColor: homeBloc.commission_amount == "0"
                  ? flottingButtonColor
                  : flottingRedTextColor,
            ),
          )),
      body: Consumer<HomeBloc>(
        builder: (context, homeBloc, child) => ModalProgressHUD(
            inAsyncCall: homeBloc.isLoading,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:
                homePageImage(homeBloc)
              // getBannerSlider(homeBloc)
            )
        ),
      ),
    );
  }

  // Widget getBannerSlider(HomeBloc homeBloc,) {
  //   var width = MediaQuery.of(context).size.width;
  //   var height = MediaQuery.of(context).size.height;
  //
  //   if(scrollPosition>homeBloc.advertisementList.length)
  //   {
  //     scrollPosition=0;
  //   }
  //   startTimer(homeBloc);
  //   return ClipRRect(
  //     child:
  //     CarouselSlider(
  //       carouselController: _scrollController,
  //       options: CarouselOptions(
  //         enlargeCenterPage: true,
  //         // autoPlay: homeBloc.advertisementList.length > 1 ? true : false,
  //         autoPlay: false,
  //         aspectRatio: width / height,
  //         scrollDirection: Axis.vertical,
  //         //autoPlayCurve: Curves.easeIn,
  //         enableInfiniteScroll: true,
  //         //initialPage: 2,
  //         // autoPlayInterval: Duration(seconds: int.parse(currDuration)),
  //         // autoPlayAnimationDuration: Duration(seconds:int.parse(currDuration)),
  //         viewportFraction: 0.85,
  //         //   pauseAutoPlayOnTouch: true,
  //         onPageChanged: (index, reason) {
  //           setState(() {
  //             currDuration = homeBloc.advertisementList[index].duration;
  //             //<-- Page index
  //           });
  //         },
  //       ),
  //
  //       items: homeBloc.advertisementList.map((i) {
  //
  //         return Builder(
  //           builder: (BuildContext context) {
  //             currDuration = i.duration;
  //             // buttonCarouselController.nextPage(duration: Duration(seconds: int.parse(i.duration)));
  //             return i.fileType == "image"
  //                 ? getImageBanner(i.advertisement)
  //                 : getVideo(i.id, homeBloc);
  //           },
  //         );
  //       }).toList(),
  //     ),
  //   );
  // }

  Widget getImageBanner(String url) {
    return Padding(
      padding: const EdgeInsets.only(left: 30,right: 30),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23),
        ),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(23)),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child:ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(23)),
              child: FadeInImage.assetNetwork(
                fit: BoxFit.fill,
                placeholder: 'assets/images/logo.png',
                image: '${APIClient.Ad_Asset_Location}${url}',
              ),
            )),
      ),
    );
  }

  // Widget getVideo(String url, HomeBloc homeBloc) {
  //   //WebViewController _controller;
  //
  //   return Container(
  //       width: double.infinity,
  //       height: MediaQuery.of(context).size.height,
  //       color: white,
  //       child: SingleChildScrollView(
  //           physics: NeverScrollableScrollPhysics(),
  //           child: Container(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Container(
  //                   width: MediaQuery.of(context).size.width,
  //                   height: MediaQuery.of(context).size.height / 4,
  //                   child: Card(
  //                     elevation: 2,
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(23),
  //                     ),
  //                     margin: EdgeInsets.only(
  //                       left: 30,
  //                       right: 30,
  //                     ),
  //                     child: ClipRRect(
  //                         borderRadius: BorderRadius.all(Radius.circular(23)),
  //                         child: Container(
  //                           height: MediaQuery.of(context).size.height / 4,
  //                           color: Colors.grey[300],
  //                           width: MediaQuery.of(context).size.width,
  //                           child:
  //                           WebView(
  //                             initialUrl:
  //                             '${'https://freezelotto.alisonsdemo.online/videoplay/'}${url}${'/'}${cus_id}',
  //                             javascriptMode: JavascriptMode.unrestricted,
  //                             onWebViewCreated:
  //                                 (WebViewController webViewController) {
  //                               _controller.complete(webViewController);
  //                             },
  //                             onPageFinished:(String url) {
  //                               print('Page finished loading: $url');
  //                             },
  //                           ),
  //                         )),
  //                   ),
  //                 ),
  //                 InkWell(
  //                   onTap: () {
  //                     // pushAndRemoveUntil(context, SwitchToAdminScreen());
  //                   },
  //                   child: Container(
  //                     width: MediaQuery.of(context).size.width,
  //                     margin: EdgeInsets.only(left: 30, right: 30, top: 30),
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.all(Radius.circular(15)),
  //                       image: DecorationImage(
  //                           image: AssetImage('assets/images/rectangle_10.png'),
  //                           fit: BoxFit.cover),
  //                     ),
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(25.0),
  //                       child: Center(
  //                           child: Text(
  //                             'Click here to Upload Advertisement',
  //                             style: style,
  //                           )),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(height: 20),
  //                 getTermsBox(homeBloc.advertisementContents.conten1,
  //                     'assets/images/thumb.png'),
  //                 getTermsBox(homeBloc.advertisementContents.conten2,
  //                     'assets/images/notess.png'),
  //                 getTermsBox(homeBloc.advertisementContents.conten3,
  //                     'assets/images/close_round.png'),
  //               ],
  //             ),
  //           )));
  // }

  Widget getTermsBox(String content, String asset) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: DottedBorder(
                color: Colors.grey, //color of dotted/dash line
                strokeWidth: 3, //thickness of dash/dots
                dashPattern: [1, 2],
                child: Container(
                  // width: MediaQuery.of(context).size.width - 61.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 26),
                              width: 30,
                              height: 30,
                              child: Image.asset(
                                asset,
                                color: iconColor,
                                fit: BoxFit.fill,
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 14),
                              width: MediaQuery.of(context).size.width - 155,
                              child: Text(
                                content,
                                // 'Chance to won Rs 1,00,000 per week for top like "NEWSFEED" post.',
                                style: style2,
                              )),
                        ],
                      ),
                    )),
              ),
            )),
      ),
    );
  }

  void updateUI() {
    setState(() {});
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

  void getUserInfo()async{
    cus_id = await Preferences.get(PrefKey.customerID);
  }

  void startTimer(HomeBloc homeBloc)
  {
    // Fluttertoast.showToast(msg: scrollPosition.toString());
    if(homeBloc.advertisementList.length>scrollPosition) {
      int duration=int.parse(homeBloc.advertisementList[scrollPosition].duration);
      if(timer!=null)
      {

        timer.cancel();
        timer=null;
      }
      timer = Timer.periodic(Duration(seconds: duration), (Timer t) =>
          resetTimer(homeBloc));

    }
  }
  Future<void> resetTimer(HomeBloc homeBloc)
  async {
    if((homeBloc.advertisementList.length-1)>scrollPosition&& (_scrollController.hasClients) ) {
      scrollPosition = scrollPosition + 1;
      // int(pos=)
      int totalLength = homeBloc.advertisementList.length - 1;
      //int delta=(totalLength-scrollPosition);
      double extent = (_scrollController.position.maxScrollExtent /
          totalLength) * scrollPosition;
      //Fluttertoast.showToast(msg: extent.toString());
      //_scrollController.scrollToIndex(1);

      await _scrollController.animateTo(
          extent, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    }
    else {
      if(_scrollController.hasClients)
        await  _scrollController.animateTo(
            0, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      scrollPosition=0;
    }
    // await _scrollController.scrollToIndex(2, preferPosition: AutoScrollPosition.begin);

    startTimer(homeBloc);
  }
  Widget homePageImage(HomeBloc homeBloc) {
    if(scrollPosition>homeBloc.advertisementList.length)
    {
      scrollPosition=0;
    }
    startTimer(homeBloc);
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
              child:
              ListView.builder(
                  controller: _scrollController,
                  itemCount: homeBloc.advertisementList.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    //WebViewController _controller;
                    videoPath = '${homeBloc.adUrl}${homeBloc.advertisementList[index].advertisement}';
                    //Fluttertoast.showToast(msg: videoPath);
                    print(videoPath);
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
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(31)),
                                  // image: DecorationImage(
                                  //  image: AssetImage('assets/images/bg_dummy.png'),
                                  //     fit: BoxFit.cover),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(31)),
                                  child:
                                  Card(
                                    color: white,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(31.0),
                                    ),
                                    child: FadeInImage.assetNetwork(
                                      fit: BoxFit.fill,
                                      placeholder: 'assets/images/logo.png',
                                      image:
                                      '${APIClient.Ad_Asset_Location}${homeBloc.advertisementList[index].advertisement}',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                            :
                        Container(
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
                                                    // child: WebView(
                                                    //   initialUrl:videoPath,
                                                    // )
                                                    child: WebView(
                                                      initialUrl: videoPath,
                                                      javascriptMode: JavascriptMode.unrestricted,
                                                      onWebViewCreated: (WebViewController webViewController) {
                                                        //  _controller=webViewController;
                                                      },
                                                    ),
                                                  )

                                              ),
                                            ),

                                          ], //<Widget>[]
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          nextPagePushReplacement(context,
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
                                      getTermsBox(homeBloc.conten1, 'assets/images/thumb.png'),
                                      getTermsBox(homeBloc.conten2, 'assets/images/notess.png'),
                                      getTermsBox(homeBloc.conten3, 'assets/images/close_round.png'),

                                    ],
                                  ),
                                ))));
                  })),

          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.of(context).pop(true);
                      });
                      return
                        AlertDialog(
                          contentPadding: EdgeInsets.all(0.0),
                          content: Container(
                              padding: const EdgeInsets.all(15.0),
                              decoration: bgFullgradient,
                              child: Text('Hi , This Feature Will Available Only on Next Version !!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                        );
                    });
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
}
