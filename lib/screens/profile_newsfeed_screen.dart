
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezlotto/blocs/gallery_bloc.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/utils/dynamic_link_service.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(ProfileNewsFeedScreen());
}

final TextStyle style2 = TextStyle(
    color: textColor,
    fontWeight: FontWeight.w400,
    fontFamily: SEMI_BOLD_FONT,
    fontSize: 14,
    letterSpacing: 0.8);
final TextStyle style3 = TextStyle(
    color: textColor,
    fontWeight: FontWeight.w400,
    fontFamily: SEMI_BOLD_FONT,
    fontSize: 16,
    letterSpacing: 0.8);
final TextStyle style4 = TextStyle(
    color: dateColor,
    fontWeight: FontWeight.w400,
    fontFamily: MEDIUM_FONT,
    fontSize: 14,
    letterSpacing: 0.8);

class ProfileNewsFeedScreen extends StatefulWidget {
  ProfileNewsFeedScreen({this.url});
  final url;
  @override
  _ProfileNewsFeedScreenState createState() =>
      new _ProfileNewsFeedScreenState();
}

class _ProfileNewsFeedScreenState extends State<ProfileNewsFeedScreen>with WidgetsBindingObserver {
  final DynamicLinkService _dynamicLinkService = DynamicLinkService();
  Timer _timerLink;
  YoutubePlayerController _controller;
  String videoUrl = " ";
  String newsFeedId = " ";
  bool isLoading = false;
  String url = "";

  @override
  void initState() {
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
    // _controller.dispose();
    // if (_timerLink != null) {
    //   _timerLink.cancel();
    // }
    super.dispose();
  }

  @override deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<GalleryBloc>(context, listen: false)
        .getProfileNewsFeedData(context);
    return Scaffold(
        body: Consumer<GalleryBloc>(
      builder: (context, galleryBloc, child) => ModalProgressHUD(
          inAsyncCall: galleryBloc.isLoading, child: getFullView(galleryBloc)),
    ));
  }

  Widget getFullView(GalleryBloc galleryBloc) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height - 174,
              child: getMiddleContainer(galleryBloc))
        ],
      ),
    );
  }

  void updateUI() {
    setState(() {
      //You can also make changes to your state here.
    });
  }

  Widget getMiddleContainer(GalleryBloc galleryBlocc) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: getList(galleryBlocc));
  }

  Widget getList(GalleryBloc galleryBloc) {
    return galleryBloc.newsfeedList.length == 0
        ? Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/images/logo.png"),
                    height: 150,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'No item found',
                    style: style3,
                  ),
                ],
              ),
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: galleryBloc.newsfeedList.length,
            itemBuilder: (BuildContext context, int index) {
              videoUrl = galleryBloc.newsfeedList[index].newsfeed;
              newsFeedId = galleryBloc.newsfeedList[index].id;
              _controller = YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(videoUrl),
                  flags: YoutubePlayerFlags(
                      enableCaption: false, isLive: false, autoPlay: false));
              return Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                      height: 221,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(23)),
                        child: YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: _controller,
                          ),
                          builder: (context, player) {
                            return;
                          },
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35, top: 10),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage(
                                    'assets/images/like.png',
                                  ),
                                  width: 15,
                                  height: 14,
                                  color: profileiconColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    '${galleryBloc.newsfeedList[index].likesCount}${' Like'} ',
                                    style: style2,
                                  ),
                                )
                              ],
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        FutureBuilder<Uri>(
                            future: _dynamicLinkService.createDynamicLink(newsFeedId),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                Uri uri = snapshot.data;
                                return
                                  InkWell(
                                    onTap: () async {
                                      Clipboard.setData(new ClipboardData(text: '${'Check this video on Freezlotto! '}\n${uri.toString()}'))
                                          .then((_) {
                                        Scaffold.of(context).showSnackBar(SnackBar(
                                            content: Text("Link copied to clipboard")));
                                      });
                                    },
                                    child:
                                    Container(
                                        width: 75,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                'assets/images/link.png',
                                              ),
                                              width: 15,
                                              height: 14,
                                              color: profileiconColor,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Text(
                                                'Copy Link',
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
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage('assets/images/notes.png'),
                                  width: 15,
                                  height: 14,
                                  color: profileiconColor,
                                ),
                                Container(
                                  width: 105,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      galleryBloc.newsfeedList[index].createDate,
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
              );
            });
  }
}
