import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezlotto/blocs/newsfeed_bloc.dart';
import 'package:freezlotto/helper/api_url_data.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/network/response/newsfeed_like_response.dart';
import 'package:freezlotto/network/response/newsfeed_list_response.dart';
import 'package:freezlotto/network/response/newsfeed_redirect_response.dart';
import 'package:freezlotto/screens/home_screen.dart';
import 'package:freezlotto/screens/newsfeed_screen_dynamic.dart';
import 'package:freezlotto/utils/alert_utils.dart';
import 'package:freezlotto/utils/api_services.dart';
import 'package:freezlotto/utils/app_utils.dart';
import 'package:freezlotto/utils/dynamic_link_service.dart';
import 'package:freezlotto/utils/locator.dart';
import 'package:like_button/like_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'newsfeed_video_dynamic.dart';
import 'profile_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);
  // await Firebase.initializeApp();
  runApp(NewsFeedScreen());
}

final TextStyle style = TextStyle(
    color: white,
    fontWeight: FontWeight.w700,
    fontFamily: SEMI_BOLD_FONT,
    fontSize: 22,
    letterSpacing: 0.8);
final TextStyle style2 = TextStyle(
    color: textColor,
    fontWeight: FontWeight.w400,
    fontFamily: SEMI_BOLD_FONT,
    fontSize: 14,
    letterSpacing: 0.8);
final TextStyle style3 = TextStyle(
    color: red,
    fontWeight: FontWeight.w400,
    fontFamily: SEMI_BOLD_FONT,
    fontSize: 14,
    letterSpacing: 0.8);

class NewsFeedScreen extends StatefulWidget {

  final url;
  String title;
  String price;
  String category;
  String id;
  String vdoid;
  @override
  _NewsFeedScreenState createState() => new _NewsFeedScreenState(id:this.id,vdoid: this.vdoid);
  NewsFeedScreen({this.url,this.title,this.category,this.price,this.id,this.vdoid});
}

class _NewsFeedScreenState extends State<NewsFeedScreen> with WidgetsBindingObserver{
  final DynamicLinkService _dynamicLinkService = DynamicLinkService();
  Timer _timerLink;
  String _customer_id;
  YoutubePlayerController _controller;
  String videoUrl = " ";
  String newsFeedId = " ";
  bool isLoading = false;
  String url = "";
  String title;
  String price;
  String category;
  String id;
  String vdoid;

  StreamController<String> controllerUrl = StreamController<String>();
  _NewsFeedScreenState({this.id,this.vdoid});
  @override
  void initState()  {
    Provider.of<NewsFeedBloc>(context, listen: false).getNewsFeedData(context,'id');

    WidgetsBinding.instance.addObserver(this);
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
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp]);
    return Scaffold(
        body: Consumer<NewsFeedBloc>(
          builder: (context, newsfeedBloc, child) =>
              ModalProgressHUD(
                  inAsyncCall: newsfeedBloc.isLoading,
                  child: getFullView(newsfeedBloc)),
        )
    );
  }

  Widget getFullView(NewsFeedBloc newsFeedBloc) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: Column(
        children: [
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 57,
            margin: EdgeInsets.only(left: 30, right: 30, top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              image: DecorationImage(
                  image: AssetImage('assets/images/rectangle_10.png'),
                  fit: BoxFit.cover),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text('${'Rs .'}${newsFeedBloc.priceMoney}', style: style),
                ),
                InkWell(
                  onTap: () {
                    newsFeedBloc.nextButtonTapped(context,newsFeedBloc,"0");
                  },
                  child: Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/rectangle_8.png'),
                            fit: BoxFit.cover)),
                    child: Container(
                        width: 16,
                        height: 13,
                        child: Image(
                            image: AssetImage('assets/images/right.png'))
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height - 261,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Image.asset(
                      "assets/images/ellipse_5.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: getMiddleContainer(newsFeedBloc)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void updateUI() {
    setState(() {
      //You can also make changes to your state here.
    });
  }
  Widget getLandScapeContainer(NewsFeedBloc newsFeedBloc,String vdoid) {
   // Provider.of<NewsFeedBloc>(context, listen: false).getNewsFeedRedirectData(context,vdoid);
    return Container(
        margin: EdgeInsets.only(bottom: 10), child: getLandList(newsFeedBloc));
  }

  Widget getListContentNew(NewsfeedsList newsfeedsListRedirect) {
    String videoUrl =newsfeedsListRedirect.newsfeed;
    newsFeedId = newsfeedsListRedirect.id;
    String liked_status = newsfeedsListRedirect.liked_status;
    if(_controller!=null)
    {
      _controller.dispose();
    }
    _controller=null;
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl),
        flags: YoutubePlayerFlags(
            enableCaption: false,
            isLive: false,
            autoPlay: true,
            controlsVisibleAtStart: true

        )
    );
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 10),
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child:
                YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: _controller,
                  ),
                  builder: (context, player) {
                    return;
                  },
                ),
              )
          ),],
      ),
    );
  }
  Widget getLandList(NewsFeedBloc newsFeedBloc) {
    return ListView.builder(
        itemCount: newsFeedBloc.newsfeedsListRedirect.length,
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {

          videoUrl = newsFeedBloc.newsfeedsListRedirect[index].newsfeed;
          newsFeedId = newsFeedBloc.newsfeedsListRedirect[index].id;
          _controller = YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(videoUrl),
              flags: YoutubePlayerFlags(
                  enableCaption: false,
                  isLive: false,
                  autoPlay: true,
                  controlsVisibleAtStart: true

              )
          );
          return getListContent(newsFeedBloc.newsfeedsListRedirect[index]);
        });
  }

  Widget getMiddleContainer(NewsFeedBloc newsFeedBloc) {
    return Container(
        margin: EdgeInsets.only(bottom: 10), child: getList(newsFeedBloc));
  }
  Widget getListContent(NewsfeedsListRedirect newsfeedsListRedirect) {
    String videoUrl =newsfeedsListRedirect.newsfeed;
    newsFeedId = newsfeedsListRedirect.id;
    if(_controller!=null)
      {
        _controller.dispose();
      }
    _controller=null;
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl),
        flags: YoutubePlayerFlags(
            enableCaption: false,
            isLive: false,
            autoPlay: true,
            controlsVisibleAtStart: true

        )
    );
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 20),
            height: 221,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(23)),
              child:
              YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                ),
                builder: (context, player) {
                  return;
                },
              ),
            )


        ),
      ],
    );
  }
  Widget getList(NewsFeedBloc newsFeedBloc) {
    return ListView.builder(

        itemCount: newsFeedBloc.newsfeedsList.length,
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {

          String convertUrlToId(String url, {bool trimWhitespaces = true}) {
            if (!url.contains("http") && (url.length == 11)) return url;
            if (trimWhitespaces) url = url.trim();

            for (var exp in [
              RegExp(
                  r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
              RegExp(
                  r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
              RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
            ]) {
              Match match = exp.firstMatch(url);
              if (match != null && match.groupCount >= 1) return match.group(1);
            }

            return null;
          }

          String getThumbnail({
            String videoId,
            String quality = ThumbnailQuality.standard,
            bool webp = true,
          }) =>
              webp
                  ? 'https://i3.ytimg.com/vi_webp/$videoId/$quality.webp'
                  : 'https://i3.ytimg.com/vi/$videoId/$quality.jpg';

          String videoId = convertUrlToId(
              newsFeedBloc.newsfeedsList[index].newsfeed);

          String thumbnailUrl = getThumbnail(videoId: videoId ?? "");
          print(thumbnailUrl);
          videoUrl = newsFeedBloc.newsfeedsList[index].newsfeed;
          newsFeedId = newsFeedBloc.newsfeedsList[index].id;
          _controller = YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(videoUrl),
              flags: YoutubePlayerFlags(
                enableCaption: false,
                isLive: false,
                autoPlay: false,
               controlsVisibleAtStart: true
              )
          );
          return Column(
            children: [
              InkWell(
                onTap: () async {
                  await Provider.of<NewsFeedBloc>(context, listen: false).getNewsFeedRedirectData(context,newsFeedBloc.newsfeedsList[index].id);
                  //Fluttertoast.showToast(msg: newsFeedBloc.newsfeedsListRedirect.length.toString());

                  showGeneralDialog(
                    barrierLabel: "Label",
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionDuration: Duration(milliseconds: 500),
                    context: context,
                    pageBuilder: (context, anim1, anim2) {
                        return
                          GestureDetector(
                            onVerticalDragUpdate: (details) {
                              int sensitivity = 10;
                              if (details.delta.dy > sensitivity ||
                                  details.delta.dy < -sensitivity) {
                                Navigator.of(context).pop();
                              }
                            },
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(

                                children: [
                                  Container(
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height,
                                    child: SizedBox.expand(child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 50),
                                          child: GestureDetector(
                                              onTap: () {
                                                SystemChrome.setPreferredOrientations(
                                                    [DeviceOrientation.portraitUp]);
                                                Navigator.of(context).pop();
                                              },
                                              child: Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 30,)),
                                        ),
                                        getListContentNew(
                                            newsFeedBloc.newsfeedsList[index]),

                                      ],
                                    )
                                      // getLandScapeContainer(newsFeedBloc,newsFeedBloc.newsfeedsList[index].id)
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );

                    },
                    transitionBuilder: (context, anim1, anim2, child) {
                      return SlideTransition(
                        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
                        child: child,
                      );
                    },
                  );
                  // Navigator.push(
                  //   context,
                  //   PageRouteBuilder(
                  //     transitionsBuilder:
                  //         (context, animation, secondaryAnimation, child) {
                  //       return ScaleTransition(
                  //         alignment: Alignment.center,
                  //         scale: Tween<double>(begin: 0.5, end: 1).animate(
                  //           CurvedAnimation(
                  //             parent: animation,
                  //             curve: Curves.fastOutSlowIn,
                  //           ),
                  //         ),
                  //         child: child,
                  //       );
                  //     },
                  //     transitionDuration: Duration(milliseconds: 600),
                  //     pageBuilder: (BuildContext context,
                  //         Animation<double> animation,
                  //         Animation<double> secondaryAnimation) {
                  //       return NewsFeedVideoDynamic(id: newsFeedBloc.newsfeedsList[index].id);
                  //     },
                  //   ),
                  // );
                },
                child: Container(
            height: 260,

            child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only( left:30,right:30,top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 260,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(23))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(23)),
                        child: Image.network(thumbnailUrl,fit: BoxFit.fill,)),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Container(height: 45,width:45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            image: DecorationImage(
                                image: AssetImage('assets/images/play.png'),
                                fit: BoxFit.cover),

                          ))),
                ], //<Widget>[]
            ),
                ),
              ),
              InkWell(
                onTap: (){
                  AppUtils.isConnectedToInternet(context).then((isConnected) {
                    if (isConnected) {
                      isLoading = true;
                      // notifyListeners();
                      APIService().likeUpdate(newsFeedBloc.newsfeedsList[index].id).then((response) {
                        isLoading = false;
                        // notifyListeners();
                        if (response.statusCode == 200) {
                          NewsFeedLikeResponse newsFeedLikeResponse = NewsFeedLikeResponse.fromJson(response.data);
                          setState(() {
                            Provider.of<NewsFeedBloc>(context, listen: false).getNewsFeedData(context,'id');

                            // nextPagePushReplacement(context, HomeScreen(tabnumber: 1,));
                          });
                          if (newsFeedLikeResponse.success == 1) {
                            AlertUtils.showToast("Liked successfully", context);

                            // getAddressList(context);
                          } else if (newsFeedLikeResponse.success == 3) {
                            kMoveToLogin(context);
                          } else {
                            AlertUtils.showToast(newsFeedLikeResponse.message, context);
                          }
                        } else {
                          AlertUtils.showToast("Failed", context);
                        }
                      });
                    }
                  });
                  // setState(() {
                  // });
                  // newsFeedBloc.onLikeButtonTapped(context, newsFeedBloc.newsfeedsList[index].id);
                    // setState(() {
                    // });
                },
                child:
                Container(
                  margin: EdgeInsets.only(left: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: white,
                          ),
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Container(
                                  width: 17, height: 15,
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/like.png',
                                    ),color: newsFeedBloc.newsfeedsList[index].liked_status == '0'?Colors.black:Colors.red,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child:newsFeedBloc.newsfeedsList[index].liked_status == '0'? Text(
                                  // ' ${newsFeedBloc.newsfeedsList[index].likesCount}${' Likes'}',
                                  ' ${newsFeedBloc.newsfeedsList[index].likesCount}',
                                  style: style2,
                                ):Text(
                                  // ' ${newsFeedBloc.newsfeedsList[index].likesCount}${' Likes'}',
                                  ' ${newsFeedBloc.newsfeedsList[index].likesCount}',
                                  style: style3,
                                ),
                              )
                            ],
                          )),
                      FutureBuilder<Uri>(
                          future: _dynamicLinkService.createDynamicLink(newsFeedId),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              Uri uri = snapshot.data;
                              return
                                InkWell(
                                  onTap: ()=> Share.share('${'Check this video on Freezlotto! '}\n${uri.toString()}'),
                                  child:
                                  Container(
                                      margin: EdgeInsets.only(left: 15),
                                      width: 96,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        color: white,
                                      ),
                                      child:
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: Container(
                                              width: 17, height: 15,
                                              child: Image(
                                                image: AssetImage(
                                                  'assets/images/share.png',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 15),
                                            child: Text(
                                              'Share',
                                              style: style2,
                                            ),
                                          )
                                        ],
                                      )),
                                );
                            } else {
                              return Container();
                            }
                          }),
                      InkWell(
                        onTap: (){
                          newsFeedBloc.reportNewsFeeds(context, newsFeedBloc.newsfeedsList[index].id);
                          setState(() {

                          });
                        },
                        child: Container(
                            width: 96,
                            height: 40,
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Container(
                                    width: 17, height: 15,
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/banned.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    'Report',
                                    style: style2,
                                  ),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

}

