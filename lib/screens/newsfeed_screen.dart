import 'dart:async';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:freezlotto/blocs/deeplink_bloc.dart';
import 'package:freezlotto/blocs/newsfeed_bloc.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_screen.dart';
import 'package:freezlotto/utils/app_utils.dart';
import 'package:freezlotto/utils/dynamic_link_service.dart';
import 'package:freezlotto/utils/locator.dart';
import 'package:like_button/like_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'newsfeed_screen_direct.dart';
import 'profile_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  NewsFeedScreen({this.url,this.title,this.category,this.price});
  final url;
  String title;
  String price;
  String category;
  @override
  _NewsFeedScreenState createState() => new _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  YoutubePlayerController _controller;
  String videoUrl = " ";
  String newsFeedId = " ";
  bool isLoading = false;
  String url = "";
  String title;
  String price;
  String category;
  StreamController<String> controllerUrl = StreamController<String>();
  void generateLink(BranchUniversalObject buo, BranchLinkProperties lp) async {
    BranchResponse response =
    await FlutterBranchSdk.getShortUrl(buo: buo, linkProperties: lp);

    if (response.success) {
      print(response.result);
      controllerUrl.sink.add('${response.result}');
    } else {
      controllerUrl.sink
          .add('Error : ${response.errorCode} - ${response.errorMessage}');
    }
  }
  @override
  void initState()  {
    // initDynamicLinks();
    // runYoutubePlayer();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override deactivate() {
    // _controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<NewsFeedBloc>(context, listen: false).getNewsFeedData(context);
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
                    setState(() {

                    });
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
  Widget getMiddleContainer(NewsFeedBloc newsFeedBloc) {
    return Container(
        margin: EdgeInsets.only(bottom: 10), child: getList(newsFeedBloc));
  }

  Widget getList(NewsFeedBloc newsFeedBloc) {
    return ListView.builder(
        itemCount: newsFeedBloc.newsfeedsList.length,
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {

          videoUrl = newsFeedBloc.newsfeedsList[index].newsfeed;
          newsFeedId = newsFeedBloc.newsfeedsList[index].id;
          _controller = YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(videoUrl),
              flags: YoutubePlayerFlags(
                  enableCaption: false,
                  isLive: false,
                  autoPlay: false,

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
              Container(
                margin: EdgeInsets.only(left: 30, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 96,
                        height: 40,
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
                                 height: 40,
                                child: LikeButton(
                                  size: 15,
                                  circleColor:
                                  CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                                  bubblesColor: BubblesColor(
                                    dotPrimaryColor: Color(0xff33b5e5),
                                    dotSecondaryColor: Color(0xff0099cc),
                                  ),
                                  likeBuilder: (bool isLiked) {

                                    return Image(
                                        image: AssetImage(
                                          'assets/images/like_black.png',
                                        ),color: newsFeedBloc.newsfeedsList[index].liked_status == "1" ? Colors.red : Colors.black,
                                    );
                                  },
                                  onTap: (isLiked) async{
                                    newsFeedBloc.onLikeButtonTapped(context, newsFeedBloc.newsfeedsList[index].id);
                                    setState(() {

                                    });
                                    return !isLiked;
                                  },
                                  likeCount: 1,
                                  countBuilder: (int count, bool isLiked, String text) {
                                    var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                                    Widget result;
                                    if (count == 1) {
                                      result = newsFeedBloc.newsfeedsList[index].liked_status == "0" ?Text(
                                        "Unlike",
                                          style: style2,
                                      ):Text(
                                        'Like',
                                        style: style3,
                                      );
                                    } else
                                      result = Text(
                                        'Like',
                                        style: style3,
                                      );
                                    return result;
                                  },
                                )
                              ),
                            ),
                          ],
                        )),
                    InkWell(
                      onTap: (){

                        BranchLinkProperties lp = BranchLinkProperties(
                            channel: 'facebook',
                            feature: 'sharing',
                            //alias: 'flutterplugin' //define link url,
                            stage: 'new share',
                            campaign: 'xxxxx',
                            tags: ['one', 'two', 'three']);
                          lp.addControlParam('\$uri_redirect_mode', '1');
                        return generateLink(
                          BranchUniversalObject(canonicalIdentifier: 'flutter/branch',
                              //canonicalUrl: '',
                              title: 'Flutter Branch Plugin',
                              imageUrl:
                              'https://flutter.dev/assets/flutter-lockup-4cb0ee072ab312e59784d9fbf4fb7ad42688a7fdaea1270ccf6bbf4f34b7e03f.svg',
                              contentDescription: 'Flutter Branch Description',
                              contentMetadata: BranchContentMetaData()
                                ..addCustomMetadata('title', 'title')
                                ..addCustomMetadata('price', 'price')
                                ..addCustomMetadata('category', newsFeedBloc.newsfeedsList[index].id)
                                ..addCustomMetadata('key', 1)
                                ..addCustomMetadata('custom_list_number', [1, 2, 3, 4, 5])
                                ..addCustomMetadata('custom_list_string', ['a', 'b', 'c']),
                              keywords: ['Plugin', 'Branch', 'Flutter'],
                              publiclyIndex: true,
                              locallyIndex: true,
                              expirationDateInMilliSec:
                              DateTime.now().add(Duration(days: 365)).millisecondsSinceEpoch),
                            lp,
                        );


                      },
                      // async{
                      //   try {
                      //     url = await AppUtils.buildDynamicLink();
                      //
                      //
                      //   } catch (e) {
                      //     print(e);
                      //   }
                      //   setState(() {
                      //     share(url, 'Freezlotto newsfeeds');
                      //   });
                      // },
                      child: Container(
                          margin: EdgeInsets.only(left: 15),
                          width: 96,
                          height: 40,
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
                    ),
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

            ],
          );
        });
  }

  // void initDynamicLinks() async {
  //   final PendingDynamicLinkData data =
  //   await FirebaseDynamicLinks.instance.getInitialLink();
  //   final Uri deepLink = data?.link;
  //
  //   if (deepLink != null) {
  //     handleDynamicLink(deepLink);
  //   }
  //   FirebaseDynamicLinks.instance.onLink(
  //       onSuccess: (PendingDynamicLinkData dynamicLink) async {
  //         final Uri deepLink = dynamicLink?.link;
  //
  //         if (deepLink != null) {
  //           handleDynamicLink(deepLink);
  //         }
  //       }, onError: (OnLinkErrorException e) async {
  //     print(e.message);
  //   });
  // }

  handleDynamicLink(Uri url) {
    List<String> separatedString = [];
    separatedString.addAll(url.path.split('/'));
    if (separatedString[1] == "post") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsFeedScreen(
              )));
    }
  }
}

