import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:freezlotto/blocs/newsfeed_bloc.dart';
import 'package:freezlotto/helper/api_url_data.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_screen.dart';
import 'package:freezlotto/utils/app_utils.dart';
import 'package:freezlotto/utils/dynamic_link_service.dart';
import 'package:freezlotto/utils/locator.dart';
import 'package:like_button/like_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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

  final url;
  String title;
  String price;
  String category;
  String id;
  @override
  _NewsFeedScreenState createState() => new _NewsFeedScreenState(id:this.id);
  NewsFeedScreen({this.url,this.title,this.category,this.price,this.id});
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

  StreamController<String> controllerUrl = StreamController<String>();
  _NewsFeedScreenState({this.id});
  @override
  void initState()  {
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
    Provider.of<NewsFeedBloc>(context, listen: false).getNewsFeedData(context,'id');
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
              InkWell(
                onTap: (){
                  setState(() {
                    newsFeedBloc.onLikeButtonTapped(context, newsFeedBloc.newsfeedsList[index].id);

                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                                      'assets/images/like.png',
                                    ),color: newsFeedBloc.newsfeedsList[index].liked_status == '0'?Colors.black:Colors.red,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child:newsFeedBloc.newsfeedsList[index].liked_status == '0'? Text(
                                  'Un like',
                                  style: style2,
                                ):Text(
                                  'Like',
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

