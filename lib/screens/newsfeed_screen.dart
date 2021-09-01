import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';
import 'package:freezlotto/screens/home_screen_video.dart';
import 'package:freezlotto/screens/upload_news_feeds.dart';

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

class NewsFeedScreen extends StatefulWidget {
  @override
  _NewsFeedScreenState createState() => new _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getFullView(),
    );
  }

  Widget getFullView() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 61,
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
                child: Text('Rs. 25000', style: style),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UploadNewsFeeds()),
                  );
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
                      child: Image(image: AssetImage('assets/images/right.png'))
                    // Image.asset('assets/images/right.png',fit: BoxFit.fitWidth,width: 16,height: 13,)
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height-246,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  height: MediaQuery.of(context).size.height ,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/ellipse_5.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child:getMiddleContainer()
              ),

            ],
          ),
        )
      ],
    );
  }

  Widget getMiddleContainer() {
    return SingleChildScrollView(
      physics: ScrollPhysics(),

      child: Container(
        margin: EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,

              // height: 61,
            ),
            Container(margin: EdgeInsets.only(bottom: 40), child: getList()),
          ],
        ),
      ),
    );
  }

  Widget getList() {
    return ListView.builder(
        itemCount: 5,
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
            height: 221,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 221,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(23))),
                  child: Image.asset(
                    'assets/images/rectangle _34.png',
                    fit: BoxFit.fill,
                  ),
                ),
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
                          child: Image(
                            image: AssetImage(
                              'assets/images/like.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Text(
                            'Like',
                            style: style2,
                          ),
                        )
                      ],
                    )),
                Container(
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
                          child: Image(
                            image: AssetImage(
                              'assets/images/share.png',
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
